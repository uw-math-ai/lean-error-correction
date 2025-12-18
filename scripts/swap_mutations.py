import re
import os
import random
import json

tactic_pairs = { 
    "linarith": ["nlinarith", "norm_num", "simp", "ring"], 
    "nlinarith": ["linarith"], 
    "norm_num": ["linarith", "simp"], 
    "ring": ["simp", "ring_nf", "field", "field_simp"], 
    "field": ["ring"], 
    "field_simp": ["simp", "ring"], 
    "simp": ["simpa", "simp_all", "dsimp", "norm_num", "linarith", "ring", "field_simp"], 
    "simpa": ["simp"], 
    "simp_all": ["simp"], 
    "dsimp": ["simp"], 
    "rw": ["simp only", "simp_rw"], 
    "simp only": ["rw"], 
    "simp_rw": ["rw"], 
    "intro": ["rintro", "intros"], 
    "rintro": ["intro"], 
    "intros": ["intro"], 
    "apply": ["refine"], 
    "refine": ["apply"], 
    "assumption": ["exact"], 
    "exact": ["assumption"], 
    "constructor": ["cases"], 
    "cases": ["rcases", "constructor"], 
    "rcases": ["cases"], 
    "induction": ["cases"], 
    "ext": ["funext", "simp"], 
    "funext": ["ext"], 
    "aesop": ["simp"] 
}

def replace_tactics(proof, pattern, max_mutations):

    # find tactics in proof 
    matches = list(re.finditer(pattern, proof))

    if not matches:
        return None
    

    # select 1-3 tactics from proof
    num_swaps = random.randint(1, min(max_mutations, len(matches)))
    selected_tactics = random.sample(matches, num_swaps)
    selected_tactics.sort(key=lambda m: m.start(), reverse=True)

    # replace tactic with similar tactic
    for tactic in selected_tactics:
        original_tactic = tactic.group(0)

        start = tactic.start()
        end = tactic.end()
        
        possible_replacements = tactic_pairs[original_tactic]
        new_tactic = random.choice(possible_replacements)
        
        proof = proof[:start] + new_tactic + proof[end:]
        
    return proof

def main(): 
    sorted_keys = sorted(tactic_pairs.keys(), key=len, reverse=True)
    pattern = r'\b(' + '|'.join(re.escape(k) for k in sorted_keys) + r')\b'

    path = "proofs/" # change for path
    output_file_name = "workbook_swap_errors" # change for output name
    max_mutations = 3
    entries_per_proof = 3

    proofs = os.listdir(path=path)
    with open(output_file_name + ".jsonl", "a") as output:
        for proof in proofs:
            with open(path + proof, 'r',encoding='utf-8') as file:
                original_proof = file.read()

            swap_1 = replace_tactics(original_proof, pattern, max_mutations)

            if swap_1 is None: # skip proofs that don't contain a swappable tactic
                continue

            line = {
                "original": original_proof,
                "swap_1": swap_1
            }

            for entry in range(1,entries_per_proof):
                line[f"swap_{entry+1}"] = replace_tactics(original_proof, pattern, max_mutations)
          
            output.write(json.dumps(line) + "\n")
            
if __name__ == "__main__":
    main()