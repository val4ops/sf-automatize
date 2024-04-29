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


# List the contents of the stable-diffusion-webui directory and write to a file
ls -l "$WORKSPACE_DIR/stable-diffusion-webui" > "$WORKSPACE_DIR/workspace_contents.txt"
ls -l "$WORKSPACE_DIR/stable-diffusion-webui/models" > "$WORKSPACE_DIR/workspace_contents.txt"
ls -l "$WORKSPACE_DIR/stable-diffusion-webui/extensions" > "$WORKSPACE_DIR/workspace_contents.txt"

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
wget -O "$WORKSPACE_DIR/stable-diffusion-webui/models/Stable-diffusion/realvisxlv4.safetensors" https://civitai.com/api/download/models/361593
echo "Downloaded realvisxlv4.safetensors model."

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

