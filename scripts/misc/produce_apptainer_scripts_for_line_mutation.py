import os, sys
from break_up_input import break_up_input

pycommands = """
cd lean-error-correction
pip install -e .
pip install langfuse
pip install asyncio
pip install aiolimiter
echo "Starting to run python scripts/line_mutation/mutate_proofs.py {dubious_proofs_path} {src_pass_path} {line_mutation_input_path}"
python scripts/line_mutation/mutate_proofs.py {dubious_proofs_path} {src_pass_path} {line_mutation_input_path}
"""

if __name__ == "__main__":
    nontrivial_args = sys.argv[1:]
    temp_path = "temp_apptainer_setups_numina_auto"
    count = 8

    
    with open("apptainer_setup", 'r') as apptainer_setup_file:
        apptainer_setup_text = apptainer_setup_file.read()
    for i in range(count):
        with open(temp_path + '/temp_script' + str(i), 'w') as temp_file:
            temp_file.write(apptainer_setup_text + pycommands.format(dubious_proofs_path="data/dubious_proofs_numina_auto" + str(i) + ".jsonl",
                                                                     src_pass_path="data/numina_auto_valid_culled" + str(i) + ".jsonl",
                                                                     line_mutation_input_path="data/line_mutation_input_numina_auto" + str(i) + ".jsonl"))