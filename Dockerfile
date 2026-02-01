FROM runpod/pytorch:2.1.2-py3.10-cuda11.8.0-devel-ubuntu22.04

SHELL ["/bin/bash", "-lc"]

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        wget \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

RUN git clone https://github.com/comfyanonymous/ComfyUI.git /workspace/ComfyUI

RUN python -m pip install --upgrade pip \
    && pip install -r /workspace/ComfyUI/requirements.txt

COPY start_comfy.sh /workspace/start_comfy.sh
COPY start_comfy.py /workspace/start_comfy.py

RUN chmod +x /workspace/start_comfy.sh

EXPOSE 8188

CMD ["bash", "/workspace/start_comfy.sh"]
