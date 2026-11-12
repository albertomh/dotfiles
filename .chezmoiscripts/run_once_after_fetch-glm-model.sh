#!/usr/bin/env bash
set -euo pipefail

MODEL_DIR="$HOME/models"
MODEL_PATH="$MODEL_DIR/GLM-4.7-Flash-Q4_K.gguf"

if [ ! -f "$MODEL_PATH" ]; then
  echo "Downloading official GLM-4.7-Flash GGUF from ggml-org..."
  mkdir -p "$MODEL_DIR"
  uvx --from huggingface-hub hf download ggml-org/GLM-4.7-Flash-GGUF \
    GLM-4.7-Flash-Q4_K.gguf \
    --local-dir "$MODEL_DIR"
fi
