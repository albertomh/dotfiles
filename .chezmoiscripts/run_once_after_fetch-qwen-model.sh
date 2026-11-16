#!/usr/bin/env bash
set -euo pipefail

MODEL_DIR="$HOME/models"
MODEL_FILE="Qwen3.8-27B-Q4_K_M.gguf"
MODEL_PATH="$MODEL_DIR/$MODEL_FILE"

if [ ! -f "$MODEL_PATH" ]; then
  echo "Downloading Qwen 3.8-27B GGUF from ggml-org..."
  mkdir -p "$MODEL_DIR"
  uvx --from huggingface-hub hf download ggml-org/Qwen3.8-27B-GGUF \
    "$MODEL_FILE" \
    --local-dir "$MODEL_DIR"
fi
