from .escape import envvar, traced, vmdetect
from .strings import split, strings_base64, xor, cleanware_from_recovered
import argparse
from .adder import code_adder,cleanware_adder,if_adder,puts_replace


if __name__ == "__main__":


    # Define the parser arguments
    main_parser = argparse.ArgumentParser()
    main_parser.add_argument("project_name")
    subparsers = main_parser.add_subparsers(help="Operation", dest='command')
    
    string_parser = subparsers.add_parser("strings")
    string_parser.add_argument("kind", choices=["split", "xor", "base64"])
    string_parser.add_argument("--text", action='store_true')
    string_parser.add_argument("--ncuts", help="Number of cuts to perform, -1 to split every char", default=-1)
    string_parser.add_argument("--no-shuffle", action='store_true', help="Do not shuffle the cuts, has no effect if --text is set")
    
    clean_parser = subparsers.add_parser("clean_adder")
    clean_parser.add_argument("--number_add", help="Number of calls to add", default=1)
    
    sys_parser = subparsers.add_parser("sys_adder")
    sys_parser.add_argument("--number_add", help="Number of calls to add", default=1)

    rand_if_parser = subparsers.add_parser("random_if")
    rand_if_parser.add_argument("--max_random", help ="Maximum value for the if comparison", default = 5)
    rand_if_parser.add_argument("--number", help = "Number of if's to add in the project", default = 1)
    
    debug_parser = subparsers.add_parser("escape")
    debug_parser.add_argument("kind", choices=["envvar", "traced", "vm", "random"])
    debug_parser.add_argument("--number", help="Number of escape to try", default=1)
    debug_parser.add_argument("--var_name", nargs= '+', action='extend', help="Name of the environment variable to escape")

    replace_puts_parser = subparsers.add_parser("replace_puts")

    basic_if_parser = subparsers.add_parser("basic_if")
    basic_if_parser.add_argument("--words", nargs = '+', help= "Words to print in the if conditions")

    get_clean_parser = subparsers.add_parser("get_clean")


    # Parse the arguments
    args = main_parser.parse_args()
 
    print(args)

    project = args.project_name


    # Execute the command
    if args.command == "strings":
        if args.kind == "split":
            split.split_strings(project, not args.text, not args.no_shuffle, int(args.ncuts))
        elif args.kind == "xor":
            xor.xor_strings(project, not args.text)
        elif args.kind == "base64":
            strings_base64.b64_strings(project, not args.text)
    elif args.command == "clean_adder":
        code_adder.clone_recovered(project)
        cleanware_adder.clean_loop(int(args.number_add), project)
    elif args.command == "sys_adder":
        code_adder.clone_recovered(project)
        lines_added = code_adder.sys_calls(int(args.number_add), project)
    elif args.command == "random_if":
        code_adder.clone_recovered(project)
        if_adder.add_random_in_main(project, int(args.max_random), int(args.number))
    elif args.command == "escape":
        if args.kind == "envvar":
            if not args.var_name:
                raise ValueError("escape envvar need at least one variable name (option --var_name)")
            envvar.inject_detect_debug(project, args.var_name)
        elif args.kind == "traced":
            traced.inject_detect_ptrace(project)
        elif args.kind == "vm":
            vmdetect.inject_detect_vm(project)
        elif args.kind == "random":
            raise NotImplementedError("Random not implemented yet")
    elif args.command == "replace_puts":
        puts_replace.replace_puts(project)
    elif args.command == "basic_if":
        if_adder.insert_basic_if_print(project, args.words)
    elif args.command == "get_clean":
        cleanware_from_recovered.gen_all_clean()