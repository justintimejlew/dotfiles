#!/bin/bash
# This script is used to create DevPods.
set -euo pipefail

if ! command -v chezmoi >/dev/null; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:justintimejlew/dotfiles.git
fi

exit 0
