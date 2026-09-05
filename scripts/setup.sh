#!/bin/bash
set -euo pipefail

# Direct path to shims for mise
export PATH="$HOME/.local/share/mise/shims:$PATH"

mise trust /workspaces/dotfiles/dot_config/mise/config.toml && mise install
# /usr/local/bin/mise trust /workspaces/dotfiles/dot_config/mise/config.toml && /usr/local/bin/mise install

if [ ! -d "$HOME/.local/share/chezmoi" ]; then
  chezmoi init --apply git@github.com/justintimejlew/dotfiles.git
else
  chezmoi apply
fi
