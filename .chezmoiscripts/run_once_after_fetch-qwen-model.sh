#!/usr/bin/env bash
set -euo pipefail

MODEL_DIR="$HOME/.local/share/llama.cpp/models"
MODEL_PATH="$MODEL_DIR/Qwen3.8-27B-Q4_K_M.gguf"

if [ ! -f "$MODEL_PATH" ]; then
  echo "Downloading official Qwen 3.8-27B GGUF from ggml-org..."
  mkdir -p "$MODEL_DIR"
  uvx --from huggingface-hub hf download ggml-org/Qwen3.8-27B-GGUF \
    Qwen3.8-27B-Q4_K_M.gguf \
    --local-dir "$MODEL_DIR"
fi
