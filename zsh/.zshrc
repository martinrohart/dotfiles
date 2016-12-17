# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in $HOME/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME=p1xelHer0

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in $HOME/.oh-my-zsh/plugins/*)
# Custom plugins may be added to $HOME/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-syntax-highlighting)

# User configuration

# base16-shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

source $HOME/dotfiles/shell/.colors

# fzf
export FZF_DEFAULT_OPTS='
  --color fg:-1,bg:-1,hl:1,fg+:4,bg+:18,hl+:1,info:20
  --color prompt:6,spinner:2,pointer:1,marker:3,header:2
'

# Load nvm
export NVM_DIR="/Users/pontusnagy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

NODE_VERSION=$(node --version | grep -v -)

# try to use vim (nvim)
export EDITOR=vim

### $PATH

## React native
# react native (nvm)
export REACT_NATIVE=$HOME/.nvm/versions/node/$NODE_VERSION/bin/react-native
# xcode simctl needed for react-native emulator
export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer/

## haskell
export STACK_PACKAGES=$HOME/.local/bin

## java (jenv)
export JENV=$HOME/.jenv/bin

## python (pyenv)
export PYENV_ROOT=$HOME/.pyenv

## android
export ANT_HOME=/usr/local/opt/ant
export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=/usr/local/opt/gradle
export ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_NDK_HOME=/usr/local/opt/android-ndk

# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"

# set the path

export PATH=$REACT_NATIVE_HOME:$PATH

export PATH=$STACK_PACKAGES:$PATH

export PATH=$JENV:$PATH

export PATH=$PYENV_ROOT/bin:$PATH

export PATH=$ANT_HOME/bin:$PATH
export PATH=$MAVEN_HOME/bin:$PATH
export PATH=$GRADLE_HOME/bin:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/23.0.1:$PATH

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="$HOME/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate $HOME/.zshrc"
# alias ohmyzsh="mate $HOME/.oh-my-zsh"

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# load aliases
source $HOME/dotfiles/shell/.alias
source $HOME/dotfiles/shell/.alias.osx

# load fasd
if which fasd > /dev/null; then eval "$(fasd --init auto)"; fi

# load fzf
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

# loading of environments has been moved to aliases

# load jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# load pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv virtualenv > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# load stack (does not work...?)
# if which stack > /dev/null; then eval "$(stack --bash-completion-script stack)"; fi

# load rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# npm tab completion
. <(npm completion)
