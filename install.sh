#!/bin/bash
set -euo pipefail
chezmoi init --apply "$(dirname "$0")"
