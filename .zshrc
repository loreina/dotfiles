# Path to your dotfiles installation.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH=/Users/loreina/.oh-my-zsh

ZSH_THEME="hyperzsh"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  autojump
)

source $ZSH/oh-my-zsh.sh

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# clean prompt
prompt_context() {}

# hide user and host name
DISABLE_AUTO_TITLE="true"

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# npm pure-prompt
autoload -U promptinit; promptinit
prompt pure

PURE_PROMPT_SYMBOL="➜"

# PS1
# export PS1="▷ "

# set editor
export EDITOR='code'
