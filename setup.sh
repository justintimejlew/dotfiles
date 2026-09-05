#!/bin/bash

set -euo pipefail

XDG_CONFIG_HOME="$HOME/.config"

if command -v zsh >/dev/null; then
  sudo chsh -s $(command -v zsh) $USER
fi

if [ ! -d "$HOME/.zsh" ]; then
  mkdir -p "$HOME/.zsh"
fi

if ! command -v chezmoi >/dev/null; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:justintimejlew/dotfiles.git
fi

exit 0
