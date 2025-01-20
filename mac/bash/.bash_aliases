# Color man pages
function _colorman() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;35m") \
        LESS_TERMCAP_md=$(printf "\e[1;34m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[7;40m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;33m") \
        "$@"
}
function man() { _colorman man "$@"; }
function perldoc() { command perldoc -n less "$@" | man -l -; }

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -al'
alias la='ls -A'
alias l='ls -C'

alias cl='clear'

alias tm='tmux_chooser'
alias tmks='tmux kill-server'
alias tmls='tmux ls'
alias tma='tmux attach'
alias tmas="tmux attach-session -t $@"
alias tmns="tmux new-session -A -d -s $@"

alias python=python3
alias vim=nvim

# Use vifmrun script for ueberzeug support
alias vifm="~/.config/vifm/scripts/vifmrun"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# alias glo='git log --oneline --all --graph --decorate --branches'
# alias glog='git log --color --graph --branches --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --decorate --all --oneline'
alias glog='git log --color --graph --branches --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --all'
alias glo='git log --color --graph --branches --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"'
alias gl='git log --color --graph --branches --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %C(bold cyan)%aD%C(reset) %Cgreen(%cr)%Creset%n""          %C(white)%s%C(reset) %C(bold blue)<%an>%Creset" --all'
alias ngit='GIT_EDITOR="nvim" git'
alias vsgit='GIT_EDITOR="code --wait" git'
alias gg='git-graph --no-pager --color always --model simple | less -r'
alias gg2='git-graph --no-pager --color always --model git-flow | less -r'
alias gp='git push'
alias gs='git status'
alias ga='git add'
alias gu='git restore --staged'
alias gc='git checkout'
alias gco='git commit'
alias gca='git commit --amend'
function gcf() {
    git commit --fixup=$*
}
alias ngc='ngit commit'
alias ngca='ngit commit --amend'
function ngcf() {
    ngit commit --fixup=$*
}
function fzfc() {
    fd . "$1" --hidden --no-ignore | fzf --print0 | xargs -0 -o code
}
function fzfn() {
    fd . "$1" --hidden --no-ignore | fzf --print0 | xargs -0 -o nvim
}
alias cdf="cd ~ && cd \$(find * -type d | fzf)"

if command -v lazygit &> /dev/null; then
    alias lg='lazygit'
fi

if command -v batcat &> /dev/null; then
    alias bat='batcat'
fi

if command -v eza &> /dev/null; then
    alias ls='eza'
    alias ll='eza -lah --group-directories-first'
    alias la='eza -lah'
    alias l='eza --group-directories-first'
    alias lt='eza -lahT -L 2'
fi

if command -v emacs &> /dev/null; then
    em() {
        echo "Running emacs in background..."
        emacsclient -c -a "" "$@" & disown
    }
    emc() {
        echo "Running emacs in background..."
        emacsclient -c -a "" "$@" & disown
    }
    alias ems="emacs --daemon"
fi

export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35\ :bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42\
:ow=34:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31\
:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31\
:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31\
:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31\
:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31\
:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31\
:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31\
:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31\
:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35\
:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35\
:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35\
:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35\
:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35\
:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35\
:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35\
:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35\
:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36\
:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36\
:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'

# vifm_pick | xargs -n 1 echo
vifm_pick()
{
  vifm -f "$@"
  cat ~/.config/vifm/vimfiles
}

# laravel sail
alias sail="./vendor/bin/sail"


##############################################
# macos only                                 #
##############################################

