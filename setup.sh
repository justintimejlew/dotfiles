#!/bin/bash
# This script is used to create DevPods.
set -euo pipefail

if [ ! -d "$HOME/.local/share/chezmoi" ]; then
  chezmoi init --apply https://github.com/justintimejlew/dotfiles.git
else
  chezmoi apply
fi

exit 0
