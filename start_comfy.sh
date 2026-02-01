#!/bin/bash
# start_comfy.sh - Custom script to start ComfyUI on RunPod

set -euo pipefail

echo "Starting ComfyUI..."

COMFY_DIR="/workspace/ComfyUI"

if [ ! -d "$COMFY_DIR" ]; then
  echo "Error: ComfyUI folder not found at $COMFY_DIR"
  exit 1
fi

cd "$COMFY_DIR"

# Optional: activate conda env if your template uses one
# source /opt/conda/etc/profile.d/conda.sh
# conda activate comfyui

python main.py \
  --listen 0.0.0.0 \
  --port 8188 \
  --preview-method auto \
  --highvram

echo "ComfyUI should be running at your RunPod proxy URL for port 8188."
