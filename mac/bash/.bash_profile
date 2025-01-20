export EDITOR='nvim'

# Start docker daemon when logging in if not already running.
# RUNNING=`ps aux | grep dockerd | grep -v grep`
# if [ -z "$RUNNING" ]; then
#   sudo dockerd > /dev/null 2>&1 &
#   disown
# fi

# Export LD_LIBRARY_PATH because ffmpegthumbnailer is broken.
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64

# Java 20 JDK
# export JAVA_HOME=/usr/lib/jvm/jdk-20
# export J2SDKDIR=/usr/lib/jvm/jdk-20
# export J2REDIR=/usr/lib/jvm/jdk-20
# export DERBY_HOME=/usr/lib/jvm/jdk-20/db
# PATH=$PATH:/usr/lib/jvm/jdk-20/bin:/usr/lib/jvm/jdk-20/db/bin

# Lua LSP Server
# PATH=~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin:$PATH
# Android platform tools
# PATH=$PATH:~/Apps/android-platform-tools
# Android studio
# PATH=$PATH:~/Apps/android-studio/bin
# ANDROID_SDK_ROOT=~/Android/Sdk

# Go
export PATH=$PATH:/usr/local/go/bin:~/go/bin
export GOPATH=~/repos/go


# TexLive
# PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"

export PATH="$PATH:/usr/local/bin"

# include ~/.local/bin if it exists
#if [ -d "$HOME/.local/bin" ] ; then
  export PATH="$HOME/.local/bin:$PATH"
#fi

# NVM
export NVM_DIR="$HOME/.nvm"

if [ -d "$HOME/.cargo" ] ; then
  . "$HOME/.cargo/env"
fi

# Use fd-find with FZF
# Make ~/.ignore to ignore specific directories
export FZF_DEFAULT_COMMAND="fdfind . $HOME"

# Reset paging because oh-my-zsh (via antigen) overwrites PAGER and LESS. This
# will at least only page if it's a full page of output and not less than that.
# export PAGER="cat"
export LESS="-F -X -R"

# Add t from t-smart-tmux-session-manager
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# Export batdiff delta options if batdiff is installed
if command -v batdiff &> /dev/null; then
  export BATDIFF_USE_DELTA=true
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
export PATH=$PATH:$HOME/.dotnet/tools

# docker
# export DOCKER_HOST=unix:///run/user/1000/docker.sock
# export PATH=$HOME/bin:$PATH

# global composer
export PATH=$PATH:$HOME/.config/composer/vendor/bin

export NVM_DIR="$HOME/.nvm"
# [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Java
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Laravel Valet
export PATH=$PATH:$HOME/.composer/vendor/bin


##############################################
# macos only                                 #
##############################################

# Add wezterm to path
export PATH="$PATH:/Applications/Wezterm.app/Contents/MacOS"

# Add php to path from homebrew
export PATH="$PATH:/opt/homebrew/opt/php@8.2/bin"

# Add vscode to path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Brew
# eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
# source "$(brew --prefix asdf)/libexec/asdf.sh"

[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

