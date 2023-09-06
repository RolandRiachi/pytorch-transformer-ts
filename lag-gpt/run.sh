#!/bin/bash

#SBATCH --partition=long
#SBATCH --cpus-per-task=2
#SBATCH --gres=gpu:rtx8000:1 # #SBATCH --gres=gpu:cn-f002:1
#SBATCH --mem=12G
#SBATCH --time=3:00:00

VENV_NAME="base"
BASE_DIR="p4-time-series/lag-gpt"
NAME="default_config_run"

module load python/3.10
source ~/${VENV_NAME}/bin/activate

for SEED in 1 # 2 3 4 5
do
    python "${BASE_DIR}"/lag-gpt-ratios.py \
    "${BASE_DIR}"/configs/config.yaml --suffix "${NAME}" --seed $SEED --dataset_path $SCRATCH
done