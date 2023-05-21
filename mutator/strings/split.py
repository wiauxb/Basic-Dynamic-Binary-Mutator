from ..helpers.utils import *
from .helpers.string_utils import *
from .helpers.string_ref import TYPES, stringRef
from ..helpers.ref import ref
from random import shuffle

def split_string_at(project, str_ref: stringRef, constantsRefs: ref, rodata: bool = False, ncuts: int = -1):
    """get and remove string(s) at <offset> in the binary of <project>
       Then replace the reference at line <line_num> in recovered.ll
       by an hardcoded splitted version of the string.
    
    Keyword arguments:
    project -- project name
    offset -- offset of string in binary
    line_num -- line num of the store instruction of the string
    Return: number of added lines 
    """
    recovered = "s2e/projects/" + project + "/s2e-out/recovered.ll"
    added_lines = -1
    if(str_ref.type == TYPES.ONE_ADDR):
        offset = str_ref.offset
        string = get_string_from_binary(project, offset)

        remove_string_from_binary(project, offset, len(string.encode()))
        added_lines = inject_splitted_string(project, string, str_ref, constantsRefs, rodata, ncuts)

    elif(str_ref.type == TYPES.TWO_ADDR):
        offsets = str_ref.offset
        strings = []
        for i, offset in enumerate(offsets):
            strings.append(get_string_from_binary(project, offset))
            remove_string_from_binary(project, offset, len(strings[i].encode()))

        added_lines = inject_splitted_string(project, strings, str_ref, constantsRefs, rodata, ncuts)

    elif(str_ref.type == TYPES.GLB_CST):
        delete_line(recovered, str_ref)
        var_name = re.findall(r'(@.*) =', str_ref.line)[0]
        var_refs = find_var_usage(project, var_name, exclude_line=[str_ref.line_num])
        added_lines = 0
        for var_ref in var_refs:
            new_ref = stringRef(TYPES.GLB_CST, var_ref.line_num, var_ref.line, -1, str_ref.string)
            local_added_lines = inject_splitted_string(project, str_ref.string, new_ref, constantsRefs, rodata, ncuts)
            for i, ref_add in enumerate(var_refs) : 
                if ref_add != var_ref:
                    var_refs[i].line_num += local_added_lines
            added_lines += local_added_lines
    
    elif(str_ref.type == TYPES.LCL_CST):
        added_lines = inject_splitted_string(project, str_ref.string, str_ref, constantsRefs, rodata, ncuts)

    if(added_lines == -1):
        raise Exception("Cannot inject in recovered LLVM")
    return added_lines

def inject_splitted_string(project, string, str_ref: stringRef, cst_ref: ref, rodata: bool = False, ncuts: int = -1):
    """Replace the reference at line <line_num> in recovered.ll
       by an hardcoded splitted version of the <string>.
    
    Keyword arguments:
    project -- project name
    string -- string to inject
    line_num -- line number where to inject 
    Return: number of added lines
    """
    recovered = "s2e/projects/" + project + "/s2e-out/recovered.ll"

    line_num = str_ref.line_num

    delete_line(recovered, str_ref)

    with open(recovered, "r") as f:
        lines = f.readlines()

    added_lines = 0

    if str_ref.type == TYPES.ONE_ADDR:
        ind = get_new_index(lines)

        constants = ""

        if rodata:
            code, constants = generate_llvm_split_string_code_with_constants(string, "spi", str_ref.line.strip(), ind, ncuts)
        else:
            code = generate_llvm_split_string_code(string, "spi", str_ref.line.strip(), ind, ncuts)

        lines.insert(line_num, f";-------------------------------\n")
        lines.insert(line_num, str_ref.get_mutated_line(f"%spi{ind}"))
        lines.insert(line_num, code)
        added_lines += 2 + len(code.splitlines())

        if rodata:
            lines.insert(cst_ref.line_num, constants)
            added_lines += len(constants.splitlines())
        
        lines, is_added = update_index(lines, ind)
        added_lines += is_added

    elif str_ref.type == TYPES.TWO_ADDR:
        ind1 = get_new_index(lines)
        ind2 = get_new_index(lines)
        lines.insert(line_num, f";-------------------------------\n")
        lines.insert(line_num, str_ref.get_mutated_line(f"%spi{ind1}", f"%spi{ind2}"))
        added_lines += 2

        constants1 = constants2 = ""

        if rodata:
            code, constants1 = generate_llvm_split_string_code_with_constants(string[0], "spi", str_ref.line.strip(), ind1, ncuts)
        else:
            code = generate_llvm_split_string_code(string[0], "spi", str_ref.line.strip(), ind1, ncuts)

        lines.insert(line_num, code)
        added_lines += len(code.splitlines())

        if rodata:
            code, constants2 = generate_llvm_split_string_code_with_constants(string[1], "spi", str_ref.line.strip(), ind2, ncuts)
        else:
            code = generate_llvm_split_string_code(string[1], "spi", str_ref.line.strip(), ind2, ncuts)
        
        added_lines += len(code.splitlines())
        lines.insert(line_num, code)

        if rodata:
            lines.insert(cst_ref.line_num, constants2)
            lines.insert(cst_ref.line_num, constants1)
            added_lines += len(constants1.splitlines()) + len(constants2.splitlines())
        
        lines, is_added = update_index(lines, ind2)
        added_lines += is_added
            
    elif str_ref.type == TYPES.GLB_CST:
        ind = get_new_index(lines)

        constants = ""

        if rodata:
            code, constants = generate_llvm_split_string_code_with_constants(string.replace("\\00", ""), f"spi{ind}", str_ref.line.strip(), ind, ncuts, format="ptr")
        else:
            code = generate_llvm_split_string_code(string.replace("\\00", ""), f"spi{ind}", str_ref.line.strip(), ind, ncuts, format="ptr")

        lines.insert(line_num, f";-------------------------------\n")
        lines.insert(line_num, str_ref.get_mutated_line(f"%spi{ind}"))
        lines.insert(line_num, code)
        added_lines += 2 + len(code.splitlines())

        if rodata:
            lines.insert(cst_ref.line_num, constants)
            added_lines += len(constants.splitlines())
        
        lines, is_added = update_index(lines, ind)
        added_lines += is_added

    elif str_ref.type == TYPES.LCL_CST:
        ind = get_new_index(lines)

        constants = ""

        if rodata:
            code, constants = generate_llvm_split_string_code_with_constants(string.replace("\\00", ""), "spi", str_ref.line.strip(), ind, ncuts, format="string")
        else:
            code = generate_llvm_split_string_code(string.replace("\\00", ""), "spi", str_ref.line.strip(), ind, ncuts, format="string")

        lines.insert(line_num, f";-------------------------------\n")
        lines.insert(line_num, str_ref.get_mutated_line(f"%spi{ind}"))
        lines.insert(line_num, code)
        added_lines += 2 + len(code.splitlines())

        if rodata:
            lines.insert(cst_ref.line_num, constants)
            added_lines += len(constants.splitlines())
        
        lines, is_added = update_index(lines, ind)
        added_lines += is_added

    else:
        raise ValueError(f"Unknown Type: {str_ref.type}")
    
    with open(recovered, "w") as f:
            f.writelines(lines)
        
    return added_lines - 1

def generate_llvm_split_string_code(string, var, infos, ind, ncuts, format : str = "ptr"):
    """Generate the LLVM code to inject a splitted version of <string> in recovered.ll.
         <var> is the name of the variable to store the string."""
    length = len(string.encode()) + 1

    code = f""";-------------------------------
; Replace: {infos}
  %sp{ind} = alloca [{length} x i8]

  """
    
    splits = generate_splitted_string(string, ncuts)
    split_len = len(splits[0].encode())
    code += f"""
  %sp0.{ind} = bitcast [{length} x i8]* %sp{ind} to [{split_len} x i8]*
  store [{split_len} x i8] c"{splits[0]}", [{split_len} x i8]* %sp0.{ind}
  %next0.{ind} = getelementptr [{length} x i8], [{length} x i8]* %sp{ind}, i32 0, i32 {split_len}
  """
    prev_added_len = split_len
    for i in range(1, len(splits)-1):
        split_len = len(splits[i].encode())
        code += f"""
  %sp{i}.{ind} = bitcast i8* %next{i-1}.{ind} to [{split_len} x i8]*
  store [{split_len} x i8] c"{splits[i]}", [{split_len} x i8]* %sp{i}.{ind}
  %next{i}.{ind} = getelementptr [{length} x i8], [{length} x i8]* %sp{ind}, i32 0, i32 {prev_added_len + split_len}
  """
        prev_added_len += split_len
    i = len(splits)-1
    split_len = len(splits[-1].encode()) + 1
    code += f"""
  %sp{i}.{ind} = bitcast i8* %next{i-1}.{ind} to [{split_len} x i8]*
  store [{split_len} x i8] c"{splits[i]}\\00", [{split_len} x i8]* %sp{i}.{ind}
"""
    if format == "ptr":
        code += f"""
  %{var}{ind} = ptrtoint [{length} x i8]* %sp{ind} to i32
"""
    elif format == "string":
        code += f"""
  %{var}{ind} = load [{length} x i8], [{length} x i8]* %sp{ind}
"""
    else:
        raise ValueError("format must be ptr or string")

    return code

def generate_llvm_split_string_code_with_constants(string, var, infos, ind, ncuts, format : str = "i32"):
    """Generate the LLVM code to inject a splitted version of <string> in recovered.ll.
         <var> is the name of the variable to store the string.
         <format> is the format of the ending <var>. Can be "ptr" or "string".
    """
    length = len(string.encode()) + 1
    splits = generate_splitted_string(string, ncuts)

    constants = []
    for i, split in enumerate(splits[:-1]):
        split_len = len(split.encode())
        constants.append(f"""
@str.{i}.{ind} = constant [{split_len} x i8] c\"{split}\"""")
    constants.append(f"""
@str.{len(splits)-1}.{ind} = constant [{len(splits[-1].encode())+1} x i8] c\"{splits[-1]}\\00\"""")
    shuffle(constants)
    cst_str = f""";-------------------------------
; Replace: {infos}{"".join(constants)}
"""

    code = f""";-------------------------------
; Replace: {infos}
  %{var if format == "ptr" else f"sp{ind}"} = alloca [{length} x i8]
  """
    
    split_len = len(splits[0].encode())
    code += f"""
  %s0.{ind} = load [{split_len} x i8], [{split_len} x i8]* @str.0.{ind}
  %sp0.{ind} = bitcast [{length} x i8]* %{var if format == "ptr" else f"sp{ind}"} to [{split_len} x i8]*
  store [{split_len} x i8] %s0.{ind}, [{split_len} x i8]* %sp0.{ind}
  %next0.{ind} = getelementptr [{length} x i8], [{length} x i8]* %{var if format == "ptr" else f"sp{ind}"}, i32 0, i32 {split_len}
  """
    prev_added_len = split_len
    for i in range(1, len(splits)-1):
        split_len = len(splits[i].encode())
        code += f"""
  %s{i}.{ind} = load [{split_len} x i8], [{split_len} x i8]* @str.{i}.{ind}
  %sp{i}.{ind} = bitcast i8* %next{i-1}.{ind} to [{split_len} x i8]*
  store [{split_len} x i8] %s{i}.{ind}, [{split_len} x i8]* %sp{i}.{ind}
  %next{i}.{ind} = getelementptr [{length} x i8], [{length} x i8]* %{var if format == "ptr" else f"sp{ind}"}, i32 0, i32 {prev_added_len + split_len}
  """
        prev_added_len += split_len
    i = len(splits)-1
    split_len = len(splits[-1].encode()) + 1
    code += f"""
  %s{i}.{ind} = load [{split_len} x i8], [{split_len} x i8]* @str.{i}.{ind}
  %sp{i}.{ind} = bitcast i8* %next{i-1}.{ind} to [{split_len} x i8]*
  store [{split_len} x i8] %s{i}.{ind}, [{split_len} x i8]* %sp{i}.{ind}
""" 
    if format == "i32":
        code += f"""
  %{var}{ind} = ptrtoint [{length} x i8]* %sp{ind} to i32
"""
    elif format == "string":
        code += f"""
  %{var}{ind} = load [{length} x i8], [{length} x i8]* %sp{ind}
"""
    elif format == "ptr":
        pass
    else:
        raise ValueError("format must be ptr or string")

    return code, cst_str

def generate_splitted_string(string, ncuts = -1):
    if ncuts == -1:
        cut = len(string)
    elif ncuts >= 2:
        cut = ncuts
    else:
        raise ValueError("ncuts must be -1 or >= 2")
    return [string[i * len(string)//cut:(i + 1) * len(string)//cut] for i in range(cut)]

def split_strings(project, rodata = False, probability = 1, number = 1, ncut = -1):
    """Mutation of <project> by removing strings from their data section
       and splitting them in the text section
    
    Keyword arguments:
    project -- project name
    """
    start_main, end_main = init_mutation(project)
    constants = find_constant_declaration_block(project)
    # for i in range(number):
    #     reset_recovered(project)
    refs = find_strings(project, start_main, end_main)
    for ref in refs:
            added_lines = split_string_at(project, ref, constants, rodata, ncut)
            for i, ref_add in enumerate(refs) : 
                if ref_add.line_num > ref.line_num:
                    refs[i].line_num += added_lines
        # save_mutation(project, f"split-{probability}{'-rodata' if rodata else ''}")
