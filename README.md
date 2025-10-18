# lean-error-correction

A project run by the [Math AI Lab](https://sites.math.washington.edu/ai/) at the University of Washington starting in Autumn 2025 (based on prior work in Summer 2025). 

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

