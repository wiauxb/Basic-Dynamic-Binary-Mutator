import subprocess
import os
import random
import sys

import requests
from .helpers.file_representation import fileRepresentation as fileRep
import urllib
from urllib.request import urlopen
import shutil


def mutation_selection(project, num_of_mutations):
    #Generate a mutation of project. 
    #Stores the resulting file and the instructions in s2e/projects/{project}/mutations

    command = f"""just lift-trace {project}"""
    subprocess.check_output(command, shell=True, timeout = 30)
    if not os.path.exists("s2e/projects/"+project+"/mutations"):
        os.makedirs("s2e/projects/"+project+"/mutations")
    a_remettre = ["strings_split" , "string_base64"]
    mutations = ["escape_envvar", "string_xor" ,"clean_adder", "random_if", "replace_puts", "sys_adder", "basic_if", "escape_traced", "escape_vm"]
    nombre_mutations = random.randrange(1, len(mutations)+1)
    mutations_to_do = []
    for i in range(nombre_mutations):
        mutation_to_append = mutations[random.randrange(0, len(mutations))]
        while mutation_to_append in mutations_to_do:
            mutation_to_append = mutations[random.randrange(0, len(mutations))]
        mutations_to_do.append(mutation_to_append)

    just_com = str(num_of_mutations) + "mutations : \n"
    for mutation in mutations_to_do : 
        if mutation == "strings_split":
            just_com += mutate_strings(project, "split")
        if mutation == "string_base64":
            just_com += mutate_strings(project, "base64")
        if mutation == "strings_split":
            just_com += mutate_strings(project, "xor")
        if mutation == "string_xor":
            just_com += mutate_clean_adder(project)
        if mutation == "random_if":
            just_com += mutate_random_if(project)
        if mutation == "escape_envvar":
            just_com += mutate_escape(project, "envvar")
        if mutation == "escape_traced":
            just_com += mutate_escape(project, "traced")
        if mutation == "escape_vm":
            just_com += mutate_escape(project, "vm")
        if mutation == "replace_puts":
            just_com += mutate_replace_puts(project)
        if mutation == "sys_adder":
            just_com += mutate_sys_adder(project)
        if mutation == "basic_if":
            just_com += mutate_basic_if(project)
        just_com += "\n"
    just_com += "\n"
    try:
        which_rec = 1
        link = ""
        if "escape_vm" in mutations_to_do:
            link += "\"mutator/escape/detect.bc\" "
            which_rec = 0
        if "string_base64" in mutations_to_do:
            link += "\"mutator/strings/bytecodes/base64.bc\" "
            which_rec = 0

        if which_rec == 0:
            command = "just link_recompile " + project + " " + link
        else:
            command = "just recompile " + project
        subprocess.check_output(command, shell=True, timeout = 30)

        shutil.copy("s2e/projects/" +project +"/s2e-out/recovered.ll", "s2e/projects/"+project+"/mutations/mutations"+str(num_of_mutations)+".ll")

        try:
            with open("s2e/projects/"+project+"/mutations/mutations_record.txt", "r") as f:
                lines = f.readlines()
            lines.append(just_com)
        except Exception as error:
            print(error)
            lines = just_com
        
        with open("s2e/projects/"+project+"/mutations/mutations_record.txt", "w") as f:
            f.writelines(lines)
        if(num_of_mutations <=1):
            return
        else:
            mutation_selection(project, num_of_mutations-1)
    except Exception as error:
        print("couldn't recompile mutation, starting again")
        exit()
        mutation_selection(project, num_of_mutations)

def mutate_basic_if(project):
    words_liste = ["Premier ", "Deuxième ", "troisieme ", "okiojvi,er ", "dergbjzeka ", "zefiĵht "]
    num_words = random.randrange(1,15)
    words = ""
    for i in range(num_words):
        words += words_liste[random.randrange(len(words_liste))]
    command = f"""just mutate {project} basic_if --words {words}"""
    subprocess.check_output(command, shell=True)
    return command

def mutate_sys_adder(project):
    number_add = random.randrange(1,22)
    command = f"""just mutate {project} sys_adder --number_add {number_add}"""
    subprocess.check_output(command, shell=True)
    return command

def mutate_replace_puts(project):
    command = f"""just mutate {project} replace_puts"""
    subprocess.check_output(command, shell=True)
    return command

def mutate_escape(project, kind):
    var_name = " "
    if kind == "envvar":
        var_name = "--var_name DEBUG GDB VM_ENABLED"
    command = f"""just mutate {project} escape {kind} """ +var_name
    subprocess.check_output(command, shell=True)
    return command

def mutate_random_if(project):
    max_random = random.randrange(2,11)
    number = random.randrange(1,11)
    command = f"""just mutate {project} random_if --max_random {max_random} --number {number}"""
    subprocess.check_output(command, shell=True)
    return command


def mutate_clean_adder(project):
    number = random.randrange(1,11)
    command = f"""just mutate {project} clean_adder --number {number}"""
    subprocess.check_output(command, shell=True)
    return command

def mutate_strings(project, choice):
    ncuts = -1
    text = random.randrange(2)
    print("text : " + str(text))
    if choice == "split":
        ncuts = random.randrange(2, 15) #15 arbitrairy, we can choose whatever we want
    command = f"""just mutate {project} strings {choice} --ncuts {ncuts}"""
    #if text:
    #    command += " --text"
    subprocess.check_output(command, shell=True)
    return command

    

if __name__ == "__main__":
    mutation_selection("hello", 3)