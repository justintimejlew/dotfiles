FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# Install mise directly
RUN curl https://mise.run | MISE_INSTALL_PATH=/usr/local/bin/mise sh

# make sure mise is activated in both zsh and bash. Might be overridden by a user's dotfiles.
RUN echo 'eval "$(mise activate bash)"' >> /home/vscode/.bashrc && \
    echo 'eval "$(mise activate zsh)"' >> /home/vscode/.zshrc

# Bake mise-managed tools into my image
USER vscode
COPY --chown=vscode:vscode dot_config/mise/config.toml /home/vscode/.config/mise/config.toml
RUN mise trust /home/vscode/.config/mise/config.toml && \
    mise install
ENV PATH="/home/vscode/.local/share/mise/shims:${PATH}"
USER root
