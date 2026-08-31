# dotfiles 🐚

Personal shell configuration and terminal customization, managed with [chezmoi](https://www.chezmoi.io/) and [mise](https://mise.jdx.dev/).

## What's Included

- **`dot_bashrc`** – Bash shell configuration, aliases, and environment variables
- **`dot_config/starship.toml`** – Starship prompt configuration
- **`dot_vimrc`** – Vim configuration
- **`dot_tmux.conf`** – Tmux configuration
- **`mise.toml`** – Tool version management (e.g. Starship, kubectl)
- **`.chezmoiscripts/`** – Automated setup scripts (package installs, tmux plugin manager, etc.) that run during `chezmoi apply`
- **`.chezmoiexternals/`** – External resources chezmoi pulls in automatically (e.g. tpm)
- **`bin/`, `local/bin/`** – Personal scripts, symlinked into `PATH`

## Requirements

- Bash 4.0+
- [chezmoi](https://www.chezmoi.io/) (auto-installed by the one-line install below if missing)
- [mise](https://mise.jdx.dev/) (manages Starship/kubectl versions; installed via `.chezmoiscripts`)
- A [Nerd Font](https://www.nerdfonts.com/) (recommended for icons/glyphs)

## Installation

Install chezmoi and apply this repo in one step:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply justintimejlew
```

If chezmoi is already installed:

```bash
chezmoi init --apply justintimejlew
```

This clones the repo into `~/.local/share/chezmoi`, runs the setup scripts in `.chezmoiscripts/` (installing packages, tmux plugin manager, etc.), and places dotfiles at their real targets — `~/.bashrc`, `~/.config/starship.toml`, `~/.vimrc`, `~/.tmux.conf` — with no manual cloning or symlinking required.

Reload your shell once it's done:

```bash
source ~/.bashrc
```

### Updating

Pull the latest changes from GitHub and reapply:

```bash
chezmoi update
```

### Editing

Edit a dotfile through chezmoi so changes flow back to the source repo:

```bash
chezmoi edit ~/.bashrc
chezmoi apply
```

Then commit and push from the source directory:

```bash
cd $(chezmoi source-path)
git add .
git commit -m "Update bashrc"
git push
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
