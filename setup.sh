#!/bin/bash
set -euo pipefail

if command -v zsh >/dev/null; then
  sudo chsh -s $(command -v zsh) $USER
fi

if ! command -v mise >/dev/null 2>&1; then
    curl https://mise.run | sh
fi

if ! command -v chezmoi >/dev/null; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:justintimejlew/dotfiles.git
fi
exit 0
