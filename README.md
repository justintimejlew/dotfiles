# dotfiles 🐚

Personal bash shell configuration and terminal customization using [Starship](https://starship.rs/).

## What's Included

- **`.bashrc`** – Bash shell configuration, aliases, and environment variables
- **`starship.toml`** – Starship prompt configuration
- **`.bash_profile`** – Login shell settings

## Requirements

- Bash 4.0+
- [Starship](https://starship.rs/) – `curl -sS https://starship.rs/install.sh | sh`
- A [Nerd Font](https://www.nerdfonts.com/) (recommended for icons/glyphs)

## Installation

```bash
git clone https://github.com/justintimejlew/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Symlink configs
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml

# Reload shell
source ~/.bashrc
```
---

> Maintained by [justintimejlew](https://github.com/justintimejlew)
