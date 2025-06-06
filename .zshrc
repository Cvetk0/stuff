# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/.yarn/bin:$HOME/.krew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jkladnik/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  docker-compose
  git
  helm
  kubectl
  urltools
  virtualenv
  vundle
  zsh-completions
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Include my aliases from .aliases file
if [ -f ~/.aliases ]; then
  source ~/.aliases
fi

fpath=($fpath "/home/jkladnik/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Spaceship custom configuration
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_BATTERY_THRESHOLD=30

# Key bindings
autoload zkbd
[[ ! -f ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE} ]] && zkbd
source ~/.zkbd/$TERM-${${DISPLAY:t}:-$VENDOR-$OSTYPE}

# Load compinit
#autoload -U compinit && compinit
autoload -Uz compinit

() {
  if [[ $# -gt 0 ]]; then
    compinit
  else
    compinit -C
  fi
} ${ZDOTDIR:-$HOME}/.zcompdump(N.mh+24)

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# Override some keybindings from .oh-my-zsh/lib/key-bindings.zsh
bindkey '^[l' down-case-word

# Disable beeps
unsetopt BEEP
export LESS="$LESS -R -Q"

# Tmux scripts
peek() { tmux split-window -p 33 vim "${@}" || exit; }

# Maven parameters
export M2_HOME=/usr/local/apache-maven
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"

fpath=($fpath "/home/jkladnik/.zfunctions")

# Default editor
export EDITOR="vim"
export VISUAL="vim"

# Completions
# Kubectl autocompletion
[[ -f /home/jkladnik/.oh-my-zsh/cache/completions/_kubectl ]] && source /home/jkladnik/.oh-my-zsh/cache/completions/_kubectl
# Istioctl autocompletion
# Kubectl autocompletion
[[ -f /home/jkladnik/.oh-my-zsh/cache/completions/_istioctl ]] && source /home/jkladnik/.oh-my-zsh/cache/completions/_istioctl
# Helm autocompletion
source <(helm completion zsh)
# Terraform autocompletion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/jkladnik/bin/terraform terraform
# AZ autocompletion
source ~/.zcomp/az.completion

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Golang Version Manager
[[ -s "/home/jkladnik/.gvm/scripts/gvm" ]] && source "/home/jkladnik/.gvm/scripts/gvm"

# NPM token for Azure repos
export NPM_TOKEN=cGc3bGhubHJjdWNud2ZmdWtyNnRtY256bWxmeW1vN2RleDc1cXJicGlnb3N2cnVycXU1YQ

# Export Gitlab token for CI linting
export GITLAB_API_TOKEN=s6Rdhg2H3uzGW6VFA7wM
alias gitlab-ci-lint='gitlab-ci-lint ${0} --url https://git.adacta-fintech.com --token ${GITLAB_API_TOKEN}'

# Enable Helm OCI support
#export HELM_EXPERIMENTAL_OCI=1

. "/home/jkladnik/.acme.sh/acme.sh.env"
