#!/bin/bash -l
#SBATCH --job-name=jamesgsy_kimina_0.6B_our_full_finetune
#SBATCH -o logs/%x_%j.out
#SBATCH --qos=normal
#SBATCH --time=02:00:00
#SBATCH --cpus-per-task=16
#SBATCH --mem=400G
#SBATCH --gpus=2

module purge
module load conda
module load gcc/11.5.0
module load cuda/12.4.0

conda activate finetune

export MAIN_PROCESS_PORT=0 

accelerate launch \
  --main_process_port ${MAIN_PROCESS_PORT} \
  /gpfs/projects/mathai/jamesgsy/scripts/finetune/finetune.py \
  --model_name AI-MO/Kimina-Prover-Distill-0.6B \
  --data_dir /gpfs/projects/mathai/jamesgsy/our_finetune_dataset \
  --output_dir /gpfs/projects/mathai/jamesgsy/kimina-06b-full-our \
  --num_train_epochs 3 \
  --batch_size 4 \
  --grad_accum_steps 8 \
  --learning_rate 3e-5 \
  --max_seq_length 16000 \
  --bf16 \
  --gradient_checkpointing \
  --wandb_api_key {your_key} \
  --wandb_project lean-error-correction \
  --wandb_run_name kimina-06b-full-our