# dotfiles 🐚

Personal bash shell configuration and terminal customization using [Starship](https://starship.rs/).

## What's Included

- **`.bashrc`** – Bash shell configuration, aliases, and environment variables
- **`starship.toml`** – Starship prompt configuration
- **`.bash_profile`** – Login shell settings
- **`.vimrc`** – Vim configuration
- **`.tmux.conf`** – Tmux configuration
- **`setup`** – Setup script that automatically places configuration files in correct place

## Requirements

- Bash 4.0+
- [Starship](https://starship.rs/)
- A [Nerd Font](https://www.nerdfonts.com/) (recommended for icons/glyphs)

## Installation

```bash
git clone https://github.com/justintimejlew/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run setup script for symlink configs
./setup

# Reload shell
source ~/.bashrc
```
---

## Nerd Font Setup
 
A Nerd Font is required to render icons and glyphs in the Starship prompt. **[JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)** is recommended for its clean look and excellent glyph coverage.
 
### macOS
```bash
brew install --cask font-jetbrains-mono-nerd-font
```
Then set your terminal font to **JetBrainsMono Nerd Font** in your terminal's preferences.
 
### Linux (manual install)
```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
 
# Download JetBrainsMono Nerd Font
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip -d JetBrainsMono
rm JetBrainsMono.zip
 
# Refresh font cache
fc-cache -fv
```
Then set your terminal emulator's font to **JetBrainsMono Nerd Font Mono**.
 
### Windows (Terminal)
1. Download **JetBrainsMono** from [nerdfonts.com](https://www.nerdfonts.com/font-downloads)
2. Unzip → select all `.ttf` files → right-click → **Install for all users**
3. Open Windows Terminal → Settings → your profile → Appearance → set font to `JetBrainsMono Nerd Font Mono`

> Maintained by [justintimejlew](https://github.com/justintimejlew)
