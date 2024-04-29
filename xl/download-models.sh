#!/bin/bash

# Models to download (XL)
#wget -O /workspace/stable-diffusion-webui/models/Stable-diffusion/realvisionv6.safetensors https://civitai.com/api/download/models/245598;
#wget -O /workspace/stable-diffusion-webui/models/Stable-diffusion/realvisionv6_inpaint.safetensors https://civitai.com/api/download/models/245627;
#wget -O /workspace/stable-diffusion-webui/models/Stable-diffusion/realvisxlv4.safetensors https://civitai.com/api/download/models/361593;
#wget -O /workspace/stable-diffusion-webui/models/Stable-diffusion/realvisxlv4_inpaint.safetensors https://civitai.com/api/download/models/297320;

# Extensions
#git clone https://github.com/ahgsql/StyleSelectorXL.git /workspace/stable-diffusion-webui/extensions/StyleSelectorXL;
#git clone https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper.git /workspace/stable-diffusion-webui/extensions/Stable-Diffusion-Webui-Civitai-Helper;
#git clone https://github.com/Bing-su/adetailer.git /workspace/stable-diffusion-webui/extensions/adetailer;

# ControlNet Model
wget -O /workspace/stable-diffusion-webui/models/ControlNet/diffusers_xl_depth_full.safetensors https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/diffusers_xl_depth_full.safetensors?download=true;

