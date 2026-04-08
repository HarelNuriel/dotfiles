# Colors
ALERT=#ff0055
DISABLED=#374151

WHITE=#f8fafc
CYAN=#00f0ff
COLD_BLUE=#06b6d4
BLUE=#60a5fa
PLASMA=#2563eb
DARK_NAVY=#312e81

autoload -Uz compinit && compinit

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY

if [ -e $HOME/.zsh_aliases ]; then
    source $HOME/.zsh_aliases
fi

if [ -e $HOME/.dircolors ]; then
	eval "$(dircolors -b $HOME/.dircolors)"
fi

export PATH="$PATH:/opt/nvim-linux-x86_64/bin:/usr/local/go/bin:/opt/cmake-4.3.1-linux-x86_64/bin/"
export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

# export EDITOR='nvim'

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

NEWLINE=$'\n'

# git plugin
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{$DARK_NAVY}-%f %F{$COLD_BLUE}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX="%B%F{$COLD_BLUE}):%f%b "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{$ALERT}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

setopt PROMPT_SUBST

# name@host customization
PROMPT='%B%F{$WHITE}%n%f %F{$DARK_NAVY}@%f %F{$BLUE}%m%f $(git_prompt_info)${NEWLINE}%B%F{$CYAN}%~%f %F{$WHITE}$%f%b '

# autosuggestion
ZSH_AUTOSUGGESTION_HIGHLIGH_STYLE="fg=$DISABLED"

# sytax highlighting
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]="fg=$PLASMA,bold"
ZSH_HIGHLIGHT_STYLES[alias]="fg=$PLASMA,bold"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=$PLASMA,bold"

ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$ALERT,bold"

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]="fg=$CYAN"
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]="fg=$CYAN"
ZSH_HIGHLIGHT_STYLES[path]="fg=$BLUE,underline"

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=$COLD_BLUE"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=$COLD_BLUE"


# start bspwm
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi
