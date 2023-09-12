#!/bin/bash

for SEED in 1 2 3 4 5
do
    for RATIO in 1 2 3 4 5
    do 
        sbatch --export=SEED="${SEED}",RATIO="${RATIO}" --output=job_logs/ratio_scaling/lag-gpt-scaling_ratios-ratio-"${RATIO}"-seed-"${SEED}".out p4-time-series/lag-gpt/run.sh
    done
done