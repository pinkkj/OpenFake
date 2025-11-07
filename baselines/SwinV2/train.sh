#!/usr/bin/bash

#SBATCH -J swin_base       
#SBATCH --gres=gpu:1                    
#SBATCH --cpus-per-gpu=8
#SBATCH --mem-per-gpu=29G
#SBATCH -p batch_ugrad                  
#SBATCH -w aurora-g1                 
#SBATCH -t 1-0                          
#SBATCH -o ../logs/swin_base_slurm-%A.out         

echo "현재 경로:" $(pwd)
echo "사용 중인 Python:" $(which python)
echo "호스트명:" $(hostname)

python train.py \
  --output_dir "./swinv2-finetuned-openfake" \
  --resume_from_checkpoint /data/juventa23/openfake/baselines/SwinV2/swinv2-finetuned-openfake/checkpoint-2500 \
  --num_epochs 4 \
  --batch_size 32 \
  --learning_rate 5e-5 \
  --num_workers 4 \
  --cache_dir ".cache"

# 작업 종료
exit 01