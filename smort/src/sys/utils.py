import os

from smort.src.sys.exitcodes import ERR_USAGE, ERR_EXHAUSTED_DISK


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


def get_all_seed_files(seed_path_list):
    if not seed_path_list:
        return None
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


def stats_control_c(sig, frame, tester):
    print("\b\b\rUser interrupt", flush=True)
    tester.printsummary_exit(False)


def silent_control_c(sig, frame, tester):
    tester.printsummary_exit(True)

