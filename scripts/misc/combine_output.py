# combine_output.py

import sys, math, os

def combine_output(output_path, dir):
    with open(output_path, 'a') as output_file:
        for path in os.listdir(dir):
            with open(dir + "/" + path, 'r') as f:
                output_file.writelines(f.readlines())

if __name__ == "__main__":
    nontrivial_args = sys.argv[1:]
    output_path, dir = nontrivial_args
    combine_output(output_path, dir)
    