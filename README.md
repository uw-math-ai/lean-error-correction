# lean-error-correction

Existing Lean datasets contain correct proofs. Models learn error correction with RL, that's expensive. We release a dataset of 260k erroneous Lean proofs, the compiler feedback, error explanation, proof repair reasoning trace, and the corrected proof.

<img width="1623" height="2133" alt="image" src="https://github.com/user-attachments/assets/0e9b4968-2bf2-4876-afd5-e07a671f7fc0" />
<img width="388" height="220" alt="image" src="https://github.com/user-attachments/assets/90b56026-7f8c-4e88-9a8c-2a3c91f24f4a" />

# Running
First, run the following commands

```
pip install -r requirements.txt
pip install -e .
```
For the full process, run these. Alternatively, you can run them in a slightly different order
```
python -m scripts.filter_files && \
python -m scripts.build_theorem_cache && \
python -m scripts.create_theorem_pairs && \
python -m scripts.expand_theorem_pairs && \
python -m scripts.create_incorrect_proofs && \
python -m scripts.annotate_proofs && \
python -m scripts.generate_explanations && \
python -m scripts.build_sft_dataset
```
## Categories
### Initial Check
For filtering into `src_pass.jsonl` (check to make sure no errors)
```
python -m scripts.filter_files
```
### Error Generation
For generating errors by replacing theorems
```
python -m scripts.build_theorem_cache && \
python -m scripts.create_theorem_pairs && \
python -m scripts.expand_theorem_pairs && \
python -m scripts.create_incorrect_proofs && \
python -m scripts.annotate_proofs
```
TODO (alternative ways to generate errors)

### Explanation
```
python -m scripts.generate_explanations && \
python -m scripts.build_sft_dataset
```

