# break_up_input.py

import sys, math

def break_up_input(input_path, count):
    name, extension = input_path.split('.')
    count = int(count)
    with open(input_path, 'r') as input_file:
        lines = input_file.readlines()
    block_size = math.ceil(len(lines) / count)
    for i in range(count):
        with open(name + str(i) + '.' + extension, 'w') as copy:
            copy.writelines(lines[:block_size])
            lines = lines[block_size:]

if __name__ == "__main__":
    nontrivial_args = sys.argv[1:]
    input_path, count = nontrivial_args
    break_up_input(input_path, count)
    