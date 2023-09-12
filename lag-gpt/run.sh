#!/bin/bash

#SBATCH --nodes=1
#SBATCH -c 2
#SBATCH --gres=gpu:1
#SBATCH --mem=12G

VENV_NAME="base"
BASE_DIR="p4-time-series/lag-gpt"
NAME="ratio_config"

module load python/3.10
source ~/${VENV_NAME}/bin/activate

export COMET_GIT_DIRECTORY="p4-time-series"

python "${BASE_DIR}"/lag-gpt-ratios.py "${BASE_DIR}"/configs/config.yaml \
--suffix "${NAME}" --seed $SEED --dataset_path $SCRATCH --ratio $RATIO
