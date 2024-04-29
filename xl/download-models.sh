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
echo "Workspace directory set to $WORKSPACE_DIR."

# Create the necessary directories
mkdir -p "$WORKSPACE_DIR/stable-diffusion-webui/models/Stable-diffusion"
echo "Created directory for Stable-diffusion models."
mkdir -p "$WORKSPACE_DIR/stable-diffusion-webui/extensions"
echo "Created directory for extensions."
mkdir -p "$WORKSPACE_DIR/stable-diffusion-webui/models/ControlNet"
echo "Created directory for ControlNet models."

# Check if the main workspace directory exists and clone the repo if it doesn't (only on macOS)
if [[ "$OS_NAME" == "Darwin" ]] && [ ! -d "$WORKSPACE_DIR/stable-diffusion-webui" ]; then
    git clone git@github.com:AUTOMATIC1111/stable-diffusion-webui.git "$WORKSPACE_DIR/stable-diffusion-webui"
    echo "Cloned AUTOMATIC1111's stable-diffusion-webui repository into $WORKSPACE_DIR/stable-diffusion-webui."
fi

# Models to download
echo "Starting to download models..."
#wget -O "$WORKSPACE_DIR/stable-diffusion-webui/models/Stable-diffusion/realvisionv6.safetensors" https://civitai.com/api/download/models/245598
#echo "Downloaded realvisionv6.safetensors model."
#wget -O "$WORKSPACE_DIR/stable-diffusion-webui/models/Stable-diffusion/realvisionv6_inpaint.safetensors" https://civitai.com/api/download/models/245627
#echo "Downloaded realvisionv6_inpaint.safetensors model."
wget -O "$WORKSPACE_DIR/stable-diffusion-webui/models/Stable-diffusion/realvisxlv4.safetensors" https://civitai.com/api/download/models/361593
echo "Downloaded realvisxlv4.safetensors model."
#wget -O "$WORKSPACE_DIR/stable-diffusion-webui/models/Stable-diffusion/realvisxlv4_inpaint.safetensors" https://civitai.com/api/download/models/297320
#echo "Downloaded realvisxlv4_inpaint.safetensors model."

# Extensions
echo "Cloning extensions..."
git clone https://github.com/ahgsql/StyleSelectorXL.git "$WORKSPACE_DIR/stable-diffusion-webui/extensions/StyleSelectorXL"
echo "Cloned StyleSelectorXL extension."
git clone https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper.git "$WORKSPACE_DIR/stable-diffusion-webui/extensions/Stable-Diffusion-Webui-Civitai-Helper"
echo "Cloned Stable-Diffusion-Webui-Civitai-Helper extension."
git clone https://github.com/Bing-su/adetailer.git "$WORKSPACE_DIR/stable-diffusion-webui/extensions/adetailer"
echo "Cloned adetailer extension."

# ControlNet Model
wget -O "$WORKSPACE_DIR/stable-diffusion-webui/models/ControlNet/diffusers_xl_depth_full.safetensors" https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/diffusers_xl_depth_full.safetensors?download=true
echo "Downloaded ControlNet model."
