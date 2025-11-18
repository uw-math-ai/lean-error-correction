#!/bin/bash

python /gpfs/projects/mathai/jamesgsy/scripts/finetune/prepare_dataset.py \
    --jsonl_file /gpfs/projects/mathai/jamesgsy/data_with_split.json \
    --output_dir /gpfs/projects/mathai/jamesgsy/our_finetune_dataset