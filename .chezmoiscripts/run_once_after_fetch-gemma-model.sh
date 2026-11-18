#!/usr/bin/env bash
set -euo pipefail

MODEL_DIR="$HOME/models"
MODEL_FILE="gemma-4-26B_q4_0-it.gguf"
MODEL_PATH="$MODEL_DIR/$MODEL_FILE"

if [ ! -f "$MODEL_PATH" ]; then
  echo "Downloading Gemma 4-26B GGUF from ggml-org..."
  mkdir -p "$MODEL_DIR"
  uvx --from huggingface-hub hf download google/gemma-4-26B-A4B-it-qat-q4_0-gguf \
    "$MODEL_FILE" \
    --local-dir "$MODEL_DIR"
fi
