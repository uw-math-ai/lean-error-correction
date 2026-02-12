# Learning to Repair Lean Proofs from Compiler Feedback

**Evan Wang, Simon Chess, Daniel Lee, Siyuan Ge, Ajit Mallavarapu, Vasily Ilin**

[![arXiv](https://img.shields.io/badge/arXiv-2602.02990-b31b1b.svg)](https://arxiv.org/abs/2602.02990)
[![HF Paper](https://img.shields.io/badge/HF-Paper-yellow.svg)](https://huggingface.co/papers/2602.02990)
[![Dataset: APRIL](https://img.shields.io/badge/Dataset-APRIL-blue.svg)](https://huggingface.co/datasets/uw-math-ai/APRIL)

<img align="right"
     src="https://github.com/user-attachments/assets/0e9b4968-2bf2-4876-afd5-e07a671f7fc0"
     width="320" />

## TL;DR
Existing Lean datasets contain correct proofs. Models learn error correction with RL, that's expensive. We release a dataset of 260k erroneous Lean proofs, the compiler feedback, error explanation, proof repair reasoning trace, and the corrected proof.

## Dataset
- **APRIL**: https://huggingface.co/datasets/uw-math-ai/APRIL  
  Contains erroneous Lean proofs, compiler feedback, diagnostic explanations, repair reasoning traces, and corrected proofs.

## Single-shot repair results
| Model | Baseline | Fine-tuned (APRIL) |
|---|---:|---:|
| Goedel-Prover-V2-8B | 15.5% | **34.6%** |
| Kimina-Prover-8B | 11.1% | **31.9%** |
| Qwen3-4B-Instruct-2507 | 1.1% | **27.4%** |

## Links
- Paper (arXiv): https://arxiv.org/abs/2602.02990  
- Hugging Face paper page: https://huggingface.co/papers/2602.02990  
- Dataset: https://huggingface.co/datasets/uw-math-ai/APRIL  

<br clear="right"/>


## Citation
```bibtex
@article{wang2026repairlean,
  title  = {Learning to Repair Lean Proofs from Compiler Feedback},
  author = {Wang, Evan and Chess, Simon and Lee, Daniel and Ge, Siyuan and Mallavarapu, Ajit and Ilin, Vasily},
  journal= {arXiv preprint arXiv:2602.02990},
  year   = {2026},
  doi    = {10.48550/arXiv.2602.02990},
  url    = {https://arxiv.org/abs/2602.02990}
}

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

