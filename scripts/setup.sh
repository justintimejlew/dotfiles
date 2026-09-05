#!/bin/bash
set -euo pipefail

# Direct path to shims for mise
export PATH="$HOME/.local/share/mise/shims:$PATH"

mise trust /workspaces/dotfiles/dot_config/mise/config.toml && mise install

if [ ! -d "$HOME/.local/share/chezmoi" ]; then
  chezmoi init --apply https://github.com/justintimejlew/dotfiles.git
else
  chezmoi apply
fi
