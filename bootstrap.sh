#!/bin/bash
# Bootstrap a fresh Mac. Run with:
#   ```sh
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/albertomh/dotfiles/main/bootstrap.sh)"
#   ```
# HTTPS (not SSH) so it works before any keys exist on the machine.
set -euo pipefail

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/albertomh/dotfiles.git}"

# 1. Homebrew: its installer also installs the Xcode Command Line Tools,
#    which is what provides git on a fresh machine.
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# 2. chezmoi
brew list chezmoi >/dev/null 2>&1 || brew install chezmoi

# 3. Apply dotfiles. This also runs `brew bundle` against the Brewfile
#    (via run_onchange_brew-bundle.sh.tmpl) and the macOS defaults script.
chezmoi init --apply "$DOTFILES_REPO"

echo "Done. Open a new terminal, then authenticate:"
echo "  ssh-keygen -t ed25519 -C \"\$(hostname)\"  # then add to GitHub"
