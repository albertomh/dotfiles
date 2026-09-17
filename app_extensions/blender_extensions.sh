#!/usr/bin/env bash

set -euo pipefail

blender_bin="${BLENDER_BIN:-blender}"
extensions=(
    bool_tool
    measureit
    print3d_toolbox
)

if ! command -v "$blender_bin" >/dev/null 2>&1; then
    echo "Blender is not installed or is not available on PATH." >&2
    exit 1
fi

extension_list="$(IFS=,; echo "${extensions[*]}")"

"$blender_bin" --online-mode --command extension install --sync --enable "$extension_list"
