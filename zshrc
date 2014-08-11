# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="ys"

# how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=3

# zsh function to open a file in x (in background and without stdout/sdterr)
xopen() {
  xdg-open $1 > /dev/null 2>&1 &
}

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(common-aliases git git-extras ssh-agent tmux gnu-utils catimg web-search)

source $ZSH/oh-my-zsh.sh

# disable autocorrection
DISABLE_CORRECTION="false"

# remove waiting indicator
COMPLETION_WAITING_DOTS="false"

# always start tmux
export ZSH_TMUX_AUTOSTART=true

# Commands that start wit a ' ' are not put into the zsh history
setopt HIST_IGNORE_SPACE

# disable autocorrection
unsetopt correct
unsetopt correct_all

# Path
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin
export PATH=$PATH:$HOME/bin:$HOME/.local/bin

# Use Vim for everything
export VISUAL=gvim
export EDITOR=vim
