#!/usr/bin/env python

import argparse
import os

from datasets import load_from_disk
from transformers import AutoModelForCausalLM, AutoTokenizer
from trl import SFTTrainer, SFTConfig


def parse_args():
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--model_name",
        type=str,
        required=True,
        help="Base model to fine-tune.",
    )
    parser.add_argument(
        "--data_dir",
        type=str,
        required=True,
        help="Directory created by DatasetDict.save_to_disk(), containing 'train' and optionally 'validation' splits.",
    )
    parser.add_argument(
        "--output_dir",
        type=str,
        required=True,
        help="Where to save the fine-tuned model.",
    )

    # --- Training hyperparameters ---
    parser.add_argument("--num_train_epochs", type=float, default=3.0)
    parser.add_argument("--batch_size", type=int, default=2, help="Per-device batch size.")
    parser.add_argument(
        "--grad_accum_steps",
        type=int,
        default=8,
        help="Gradient accumulation steps (increase if you run out of VRAM).",
    )
    parser.add_argument("--learning_rate", type=float, default=2e-5)
    parser.add_argument(
        "--max_seq_length",
        type=int,
        default=16000,
        help="Max sequence length for tokenization/truncation.",
    )

    # --- Precision / efficiency ---
    parser.add_argument(
        "--bf16",
        action="store_true",
        help="Use bfloat16 training (preferred on A100/H100 if supported).",
    )
    parser.add_argument(
        "--fp16",
        action="store_true",
        help="Use float16 training (for older GPUs).",
    )
    parser.add_argument(
        "--gradient_checkpointing",
        action="store_true",
        help="Enable gradient checkpointing to save memory.",
    )

    # --- Weights & Biases logging ---
    parser.add_argument(
        "--wandb_api_key",
        type=str,
        default=None,
        help="W&B API key. If set, logging to W&B is enabled.",
    )
    parser.add_argument(
        "--wandb_project",
        type=str,
        default=None,
        help="W&B project name. If set, logging to W&B is enabled.",
    )
    parser.add_argument(
        "--wandb_run_name",
        type=str,
        default=None,
        help="Optional W&B run name.",
    )
    parser.add_argument(
        "--wandb_entity",
        type=str,
        default=None,
        help="Optional W&B entity (team/user).",
    )

    return parser.parse_args()


def main():
    args = parse_args()

    wandb
    
    # --- W&B setup (via environment variables) ---
    report_to = []
    if args.wandb_api_key and args.wandb_project:
        os.environ["WANDB_API_KEY"] = args.wandb_api_key
        os.environ["WANDB_PROJECT"] = args.wandb_project
        if args.wandb_run_name:
            os.environ["WANDB_NAME"] = args.wandb_run_name
        if args.wandb_entity:
            os.environ["WANDB_ENTITY"] = args.wandb_entity
        report_to = ["wandb"]
    else:
        # disable wandb auto-init if you don't want it
        os.environ.setdefault("WANDB_MODE", "disabled")

    # --- Load dataset ---
    dataset_dict = load_from_disk(args.data_dir)

    train_dataset = dataset_dict["train"]
    eval_dataset = dataset_dict["validation"] if "validation" in dataset_dict else None

    # --- Training configuration (full fine-tune) ---
    training_args = SFTConfig(
        output_dir=args.output_dir,
        num_train_epochs=args.num_train_epochs,
        per_device_train_batch_size=args.batch_size,
        per_device_eval_batch_size=args.batch_size,
        gradient_accumulation_steps=args.grad_accum_steps,
        max_length=args.max_seq_length,
        warmup_ratio=0.03,
        lr_scheduler_type="cosine",
        learning_rate=args.learning_rate,
        
        logging_steps=50,
        save_steps=1000,
        save_total_limit=2,
        eval_strategy="steps" if eval_dataset is not None else "no",
        eval_steps=500,
        gradient_checkpointing=args.gradient_checkpointing,
        report_to=report_to,
        
        bf16=args.bf16,
        fp16=args.fp16,
        
        # SFT-specific:
        packing=False,              # set True if you want packed sequences
        dataset_text_field=None,    # let SFTTrainer auto-detect "messages"
        completion_only_loss=True,   # compute loss only on assistant completion responses
    )

    # --- Create trainer (full-parameter finetune: no peft_config) ---
    trainer = SFTTrainer(
        model=args.model_name,
        args=training_args,
        train_dataset=train_dataset,
        eval_dataset=eval_dataset,
    )

    # --- Train ---
    trainer.train()

    # --- Save final model (full weights) ---
    trainer.save_model(args.output_dir)

if __name__ == "__main__":
    main()
