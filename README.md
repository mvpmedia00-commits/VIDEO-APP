# VIDEO-APP

## RunPod Setup

This repo includes helper scripts to start ComfyUI.

### 1) Create a RunPod Pod
- Use a GPU template that supports CUDA.
- Ensure Git is available (most templates include it).

### 2) Clone the repo
```bash
git clone https://github.com/mvpmedia00-commits/VIDEO-APP.git
cd VIDEO-APP
```

### 3) Start ComfyUI
```bash
bash start_comfy.sh
```

### 4) Notes
- If you use a custom RunPod container, make sure it has:
  - `bash`
  - `python3`
  - `git`
- If `start_comfy.sh` relies on additional system packages, install them in your container or pod startup script.

## Files
- `start_comfy.sh`: Shell entrypoint for starting ComfyUI.
- `start_comfy.py`: Python helper used by the shell script.
