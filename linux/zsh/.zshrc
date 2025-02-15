# Set up the prompt
autoload -Uz promptinit
promptinit
#prompt adam1

# Load plugins
source ~/.config/zsh/antigen.zsh
# Use oh-my-zsh's plugin library
antigen use oh-my-zsh

# For MacOS: must first brew tap homebrew/command-not-found
antigen bundle command-not-found
antigen bundle copyfile
# Currently handled by starship
antigen bundle git-prompt
antigen bundle jsontools
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle aliases
antigen bundle emoji
antigen bundle encode64
antigen bundle gitfast
antigen bundle gitignore
antigen bundle globalias
antigen bundle isodate
antigen bundle urltools
antigen bundle zsh-interactive-cd
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle Tarrasch/zsh-bd
antigen bundle Aloxaf/fzf-tab
antigen bundle zdharma-continuum/history-search-multi-word@main

# antigen theme robbyrussell
antigen theme ~/.config/zsh/themes faircode.zsh-theme --no-local-clone

antigen apply


setopt histignorealldups sharehistory

# Remap globalias so space is normal space, and ctrl + space is the expansion.
bindkey -M emacs " " magic-space
bindkey -M viins " " magic-space
bindkey -M emacs "^ " globalias
bindkey -M viins "^ " globalias
bindkey -M isearch " " magic-space

# Edit current command in nvim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^E" edit-command-line

# Use emacs keybindings even if our EDITOR is set to vi
# bindkey -e

# Use vim keybindings via the zsh-vi-mode plugin.
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

function zvm_after_init() {
  bindkey "^R" history-search-multi-word
}
# Fix search keybinds
# bindkey "^R" history-incremental-pattern-search-backward
# bindkey "^S" history-incremental-pattern-search-forward

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# history-search-multi-word styl
zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold"
zstyle ":history-search-multi-word" page-size "20"
zstyle ":plugin:history-search-multi-word" synhl "no"

#unsetopt complete_aliases

[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"
[[ -s "$HOME/.bash_profile" ]] && source "$HOME/.bash_profile"

# Set ZSH to use nvim for editor actions such as editing the command line (vv
# from normal mode)
export ZVM_VI_EDITOR="nvim"

# Load Angular CLI autocompletion.
# source <(ng completion script)

# Load Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# .NET com# zsh parameter completion for the dotnet CLI
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


##############################################
# linux only                                 #
##############################################

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Java
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
