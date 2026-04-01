autoload -Uz compinit && compinit

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt APPEND_HISTORY

[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases
if [ -e ~/.dircolors ]; then
	eval "$(dircolors -b ~/.dircolors)"
fi

export PATH=$PATH
export ZSH="$HOME/.oh-my-zsh"

plugins=(git)

# export EDITOR='nvim'

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

NEWLINE=$'\n'

# git plugin
ZSH_THEME_GIT_PROMPT_PREFIX="%B%F{#719cd6}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX="%B%F{#719cd6}):%f%b "
ZSH_THEME_GIT_PROMPT_DIRTY="%F{#c94f6d}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# name@host customization
PROMPT="%F{#63cdcf}%n%f@%F{#719cd6}%m%f $(git_prompt_info)${NEWLINE}%B%F{#c0cbd6}%~%f%b: "

# autosuggestion
ZSH_AUTOSUGGESTION_HIGHLIGH_STYLE="fg=#2d3846"

# sytax highlighting
ZSH_HIGHLIGHT_STYLES[command]='fg=#63cdcf,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#63cdcf,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#63cdcf,bold'

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#c94f6d,bold'

ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#719cd6'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#719cd6'
ZSH_HIGHLIGHT_STYLES[path]='fg=#c0cbd6,underline'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#c0cbd6'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#c0cbd6'
