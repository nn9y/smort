import os
import random
import string

from smort.src.base.exitcodes import OK_NOBUGS, OK_BUGS, ERR_USAGE, ERR_EXHAUSTED_DISK


def create_folder(folder_path):
    if os.path.isfile(folder_path):
        print(f'error: "{folder_path}" is file', flush=True)
        exit(ERR_USAGE)
    if not os.path.isdir(folder_path):
        try:
            os.mkdir(folder_path)
        except Exception:
            print(f'error: folder "{folder_path}" cannot be created', flush=True)
            exit(ERR_EXHAUSTED_DISK)

def get_seeds(seed_path_list):
    seeds_list = []
    for path in seed_path_list:
        if not os.path.exists(path):
            print(f'error: folder/file "{path}" does not exist',
                  flush=True)
            exit(ERR_USAGE)
        if os.path.isfile(path):
            seeds_list.append(path)
        elif os.path.isdir(path):
            for subdir, _, files in os.walk(path):
                for filename in files:
                    filepath = subdir + os.sep + filename
                    if filepath.endswith(".smt2"):
                        seeds_list.append(filepath)
        else:
            print(f'error: "{path}" is neither a file nor a directory', flush=True)
            exit(ERR_USAGE)

    return seeds_list

def stats_control_c(sig, frame, fuzzer):
    print("\b\b\rUser interrupt", flush=True)
    fuzzer.printsum_exit(False)


def silent_control_c(sig, frame, fuzzer):
    fuzzer.printsum_exit(True)


def random_string(length=5):
    return "".join(random.sample(string.ascii_letters + string.digits, length))


def plain(cli):
    plain_cli = ""
    for token in cli.split(" "):
        plain_cli += token.split("/")[-1]
    return escape(plain_cli)


def escape(s):
    s = s.replace(".", "")
    s = s.replace("=", "")
    return s


def in_list(stdout, stderr, lst):
    stdstream = f"{stdout} {stderr}"
    for err in lst:
        if err in stdstream:
            return True
    return False

