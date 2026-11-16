#!/usr/bin/env bash
set -euo pipefail

MODEL_DIR="$HOME/models"
MODEL_FILE="GLM-4.7-Flash-Q4_K.gguf"
MODEL_PATH="$MODEL_DIR/$MODEL_FILE"

if [ ! -f "$MODEL_PATH" ]; then
  echo "Downloading GLM-4.7-Flash GGUF from ggml-org..."
  mkdir -p "$MODEL_DIR"
  uvx --from huggingface-hub hf download ggml-org/GLM-4.7-Flash-GGUF \
    "$MODEL_FILE" \
    --local-dir "$MODEL_DIR"
fi
