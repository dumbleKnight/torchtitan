#!/bin/bash

# 设置Python路径
export CUDA_LAUNCH_BLOCKING=1
export PYTHONPATH=/nfs/yy/torchtitan:$PYTHONPATH
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True

CONTAINER_SCRIPT="torchrun --nnodes=1 \
    --nproc_per_node=8 \
    --tee 3 -m torchtitan.experiments.deepseek_v3.train_ds_real \
    --job.config_file /nfs/yy/torchtitan/torchtitan/experiments/deepseek_v3/train_configs/deepseek_v2.toml \
    --job.dump_folder=/nfs/yy/model_save \
    --checkpoint.folder=/nfs/yy/save_ckpt \
    --checkpoint.enable_checkpoint"

sh -c "${CONTAINER_SCRIPT}" 