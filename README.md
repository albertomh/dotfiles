# dotfiles

Config-as-code for a Mac:

- [Homebrew Bundle](https://docs.brew.sh/Brew-Bundle-and-Brewfile) for packages
- [chezmoi](https://www.chezmoi.io) for dotfiles
- a single bootstrap script as entrypoint

## Set up a new machine (or disaster recovery)

Run:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/albertomh/dotfiles/main/bootstrap.sh)"
```

This:

1. installs the Xcode Command Line Tools & `Homebrew`
1. installs `chezmoi`
1. applies this repo:
    - prompts once for git name/email (defaults offered)
    - creates dotfiles in `$HOME`
    - runs `brew bundle` against the `Brewfile`
    - runs `run_once_macos-defaults.sh` to set system preferences

Then authenticate (the only unavoidable manual step - secrets mustn't live in git):

```sh
# add public key to GitHub
ssh-keygen -t ed25519 -C "$(hostname)"
```

## Day to day

```sh
# change a managed dotfile
chezmoi edit ~/.config/foo

# preview changes
chezmoi diff

# pull + apply changes
chezmoi update
```

## Layout

- `run_once_macos-defaults.sh` — system preferences, once per machine
- `bootstrap.sh` — installs Homebrew & chezmoi, hands off to `chezmoi init --apply`
- `Brewfile` — every package/app on the machine
- `dot_*` — dotfiles (`dot_zshrc` generates `~/.zshrc`); `.tmpl` files get data from chezmoi config
- `run_onchange_brew-bundle.sh.tmpl` — re-runs `brew bundle` when the Brewfile changes
- `.chezmoidata.yaml` — exposes variables as template data for dotfiles

## Updating VS Code configuration

VS Code user configuration is tracked in this repository.

After making changes to VS Code settings, keybindings, or snippets locally, update the tracked files with:

```bash
# from anywhere
chezmoi add ~/Library/Application\ Support/Code/User/settings.json
chezmoi add ~/Library/Application\ Support/Code/User/keybindings.json
chezmoi add ~/Library/Application\ Support/Code/User/snippets
```

Review the changes:

```bash
chezmoi cd
git diff
```

Then commit and push the updated dotfiles.
