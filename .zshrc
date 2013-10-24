# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spr"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# Vi keybindings
# Tweaked for use
bindkey -v
# ensures that I can delete over stuff that was done in a previous insert
# session, not proper vi action
bindkey -M viins '' backward-delete-char
bindkey -M viins '' backward-delete-char
stty ek

# OS X Editing Shortcuts (opt,cmd arrows)
bindkey -M viins '^[[A' up-line-or-search
bindkey -M viins '^[[B' down-line-or-search
bindkey -M viins "^[[H" beginning-of-line
bindkey -M viins "^[[F"  end-of-line
bindkey -M viins "^[f" forward-word
bindkey -M viins "^[b" backward-word

# Saner Path
export PATH="$HOME/bin:$HOME/.rbenv/bin:/usr/local/bin:$PATH"
eval "$(rbenv init -)"

alias vi=vim
export EDITOR=vim
unset LS_COLORS

setopt HIST_IGNORE_SPACE

export TRANSPORTER_HOME=$(xcode-select --print-path)/../Applications/Application\ Loader.app/Contents/MacOS/itms/bin
