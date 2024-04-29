#!/bin/bash

# Determine the operating system and set the workspace directory
OS_NAME="$(uname)"
if [[ "$OS_NAME" == "Darwin" ]]; then
    # macOS
    WORKSPACE_DIR="$HOME/workspace"
    echo "Operating System: macOS"
else
    # Assume Linux
    WORKSPACE_DIR="/workspace"
    echo "Operating System: Linux"
fi
# Check if the main workspace directory exists and clone the repo if it doesn't (only on macOS)
if [[ "$OS_NAME" == "Darwin" ]] && [ ! -d "$WORKSPACE_DIR/stable-diffusion-webui" ]; then
    git clone git@github.com:AUTOMATIC1111/stable-diffusion-webui.git "$WORKSPACE_DIR/stable-diffusion-webui"
fi

# Create the necessary directories
mkdir -p "$WORKSPACE_DIR/stable-diffusion-webui/models/ControlNet"

# Models to download
#wget -O "$WORKSPACE_DIR/stable-diffusion-webui/models/Stable-diffusion/realvisionv6.safetensors" https://civitai.com/api/download/models/245598
#wget -O "$WORKSPACE_DIR/stable-diffusion-webui/models/Stable-diffusion/realvisionv6_inpaint.safetensors" https://civitai.com/api/download/models/245627
wget -O "$WORKSPACE_DIR/stable-diffusion-webui/models/Stable-diffusion/realvisxlv4.safetensors" https://civitai.com/api/download/models/361593
#wget -O "$WORKSPACE_DIR/stable-diffusion-webui/models/Stable-diffusion/realvisxlv4_inpaint.safetensors" https://civitai.com/api/download/models/297320

# Extensions
git clone https://github.com/ahgsql/StyleSelectorXL.git "$WORKSPACE_DIR/stable-diffusion-webui/extensions/StyleSelectorXL"
git clone https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper.git "$WORKSPACE_DIR/stable-diffusion-webui/extensions/Stable-Diffusion-Webui-Civitai-Helper"
git clone https://github.com/Bing-su/adetailer.git "$WORKSPACE_DIR/stable-diffusion-webui/extensions/adetailer"

# ControlNet Model
wget -O "$WORKSPACE_DIR/stable-diffusion-webui/models/ControlNet/diffusers_xl_depth_full.safetensors" https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/diffusers_xl_depth_full.safetensors?download=true
