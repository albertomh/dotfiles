#!/usr/bin/env bash
set -euo pipefail

MODEL_DIR="$HOME/models"
MODEL_FILE="gemma-4-26B-A4B-it-Q4_0.gguf"
MODEL_PATH="$MODEL_DIR/$MODEL_FILE"

if [ ! -f "$MODEL_PATH" ]; then
  echo "Downloading Gemma 4-26B GGUF from ggml-org..."
  mkdir -p "$MODEL_DIR"
  uvx --from huggingface-hub hf download ggml-org/gemma-4-26B-A4B-it-GGUF \
    "$MODEL_FILE" \
    --local-dir "$MODEL_DIR"
fi
