# dotfiles 🐚

My personal shell configuration and terminal customization, managed with [chezmoi](https://www.chezmoi.io/) and [mise](https://mise.jdx.dev/). Primarily used inside a [DevPod](https://devpod.sh/) devcontainer.

## What's Included

- **`.devcontainer/`** – Dockerfile + devcontainer.json for DevPod, with tools baked into the image for fast container spin-up
- **`.chezmoiscripts/`** – Automated setup scripts run during `chezmoi apply`:
  - `run_once_before_install-packages.sh.tmpl` – installs zsh/tmux/vim/curl + libatomic(1), installs mise, sets zsh as my default shell
  - `run_once_before_selinux-devpod.sh.tmpl` – configures SELinux `container_file_t` context for my DevPod workspaces on my Fedora hosts only
  - `run_onchange_after_install_packages.sh.tmpl` – trusts and installs mise-managed tools
- **`.chezmoiexternal.toml`** – External resources chezmoi pulls in automatically (mise binary, devpod CLI, LazyVim config)
- **`.chezmoi.toml.tmpl`** – Detects local vs. remote (DevPod/container) environment and adjusts behavior accordingly
- **`dot_zshrc`** – Zsh shell configuration, aliases, environment variables (default shell)
- **`dot_tmux.conf`** – Tmux configuration
- **`dot_config/nvim`** – Neovim config (LazyVim, pulled in via `.chezmoiexternal.toml`)
- **`dot_config/mise/config.toml`** – Tool version management (starship, kubectl, neovim, node, bat, lsd, fzf, lazygit, ripgrep, usage, etc.)
- **`dot_config/starship.toml`** – Starship prompt configuration
- **`local/bin/`** – My personal scripts, symlinked into `PATH`
- **`dot_bashrc`** – Bash shell configuration, aliases, and environment variables
- **`dot_vimrc`** – Vim configuration

## Installation

### Local machine (Fedora / Ubuntu / Debian)

I simply have to run the following command to install chezmoi, my packages, mise, set zsh as default shell, and apply all my dotfiles:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply https://github.com/justintimejlew/dotfiles.git && exec zsh -l
```

If chezmoi is already installed, I can simply run:

```bash
chezmoi init --apply https://github.com/justintimejlew/dotfiles.git && exec zsh -l
```

**NOTE:**
- Confirm local directories are owned by `$USER`.
- `sudo` permission is required to install packages and to change the shell.

### DevPod / DevContainer

Clone the repo to home directory:

```bash
git clone git@github.com:justintimejlew/dotfiles.git
devpod up . --ide none
```

**NOTE:** The setup runs automatically to build the DevPod according to the `postCreateCommand` (`scripts/setup.sh`). Then the devcontainer image ([`.devcontainer/Dockerfile`](.devcontainer/Dockerfile)) bakes in zsh/tmux/vim, mise, and all mise-managed tools ahead of time for fast container creation. `.chezmoi.toml.tmpl` detects the remote/container environment and skips steps that don't apply there (DevPod CLI install, SELinux config, git autoCommit/autoPush, interactive shell change).

### Updating

Pull the latest changes from GitHub and reapply:

```bash
chezmoi update
```

### Editing

The best practice is to only edit a dotfile through chezmoi so changes flow back to this repo:

```bash
chezmoi edit ~/.zshrc
chezmoi apply
```
- `chez` is my alias to access the chezmoi files.

Any changes I make, I commit and push from the source directory (which is why I have so many commits, lol):

```bash
git add .
git commit -m "Update zshrc"
git push
```

## Nerd Font Setup (Optional)

I used **[JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)** because it is recommended for its clean look and extensive glyph coverage.

### macOS

Run the following:

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

Then set the terminal font to **JetBrainsMono Nerd Font** in terminal's preferences.

### Linux (manual install)

Run the following:

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

## My Lessons Learned

- **Mise activation order:** `mise activate` must run *before* `starship init` in `dot_zshrc`, or the starship shim won't be on `PATH` yet.
- **SELinux + DevPod:** DevPod workspace directories need the `container_file_t` SELinux context on Fedora hosts, applied via `semanage fcontext` + `restorecon` rather than disabling SELinux outright.
- **Distro-aware scripting:** DevPod containers are Debian/Ubuntu-based even when the host is Fedora — scripts branch on `dnf`/`apt-get` availability rather than assuming one distro.

> Maintained by [justintimejlew](https://github.com/justintimejlew)