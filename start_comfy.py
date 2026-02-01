# start_comfy.py - Custom program to launch ComfyUI on RunPod

import os
import subprocess
import sys

COMFY_DIR = "/workspace/ComfyUI"


def main() -> int:
    print("Launching ComfyUI...")

    if not os.path.isdir(COMFY_DIR):
        print(f"Error: ComfyUI folder not found at {COMFY_DIR}")
        return 1

    os.chdir(COMFY_DIR)

    args = [
        sys.executable,
        "main.py",
        "--listen",
        "0.0.0.0",
        "--port",
        "8188",
        "--preview-method",
        "auto",
        "--highvram",
    ]

    try:
        subprocess.run(args, check=True)
        return 0
    except KeyboardInterrupt:
        print("\nStopped ComfyUI.")
        return 130
    except Exception as exc:
        print(f"Error starting ComfyUI: {exc}")
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
