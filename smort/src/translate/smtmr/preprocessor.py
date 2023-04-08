import re
import os


def preprocess(file_path):
    """
    A simple preprocessor for SMTMR that replaces all instances of (import <file>) with the contents of the imported file.
    """
    with open(file_path, 'r') as f:
        content = f.read()
    
    imports = re.findall(r'\(\s*import\s+\"(.*)\"\s*\)', content)

    if len(imports) == 0:
        return file_path

    for imp in imports:
        # get the path of the imported file
        # assume in the same directory
        imp_path = os.path.join(os.path.dirname(file_path), imp)
        with open(imp_path, 'r') as f:
            imp_content = f.read()
        content = content.replace(f'(import "{imp}")', imp_content)
    
    # smort/smort/src/translate/smtmr/preprocessor.py
    root_dir = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))))
    # smort/tmp
    tmp_dir = os.path.join(root_dir, 'tmp')
    new_file_path = os.path.join(tmp_dir, os.path.basename(file_path)) 

    with open(new_file_path, 'w') as f:
        f.write(content)
    
    return new_file_path