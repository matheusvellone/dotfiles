# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

IS_WSL=false
IS_MAC=false
IS_LINUX=false

if [[ ! -z $WSL_DISTRO_NAME ]] then
  IS_WSL=true
fi

if [ "$(uname)" = "Darwin" ]; then
  IS_MAC=true
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
  IS_LINUX=true
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
source ~/.zplug/init.zsh

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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

zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-docker"
zplug "zsh-users/zsh-history-substring-search"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=245"

if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  docker
  terraform
  docker-compose
  aws
  fzf
  nvm
  yarn
  npm
  tmux
)

source $ZSH/oh-my-zsh.sh

setopt histignoredups

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Abbreviation
alias g='git'
alias t='tmux'
alias te='terraform'
alias d='docker'
alias dc='docker-compose'
alias hg='history | grep'

# Aliases
alias vim='nvim'
alias ls='lsd'
alias ll='ls -lha'
alias cat='bat'
alias lua='lua5.3'

alias dclean='docker ps -aq | xargs docker stop; docker ps -aq | xargs docker rm'
alias my_ip='curl -4 ifconfig.io'
alias unlock='echo "export BW_SESSION=$(bw unlock --raw)" >> ~/.zprofile && source ~/.zprofile'

2fa() {
    TOTP=$(bw get totp $1)

    $IS_WSL && (echo $TOTP | clip.exe)
    $IS_LINUX && ! $IS_WSL && echo $TOTP | xclip -selection clipboard

    echo "Copied $1 ($TOTP) 2fa token to clipboard :)"
}

password() {
    PASSWORD=$(bw get password $1)

    $IS_WSL && (echo $PASSWORD | clip.exe)
    $IS_LINUX && ! $IS_WSL && echo $PASSWORD | xclip -selection clipboard

    echo "Copied $1 password to clipboard :)"
}

aws_login() {
  eval "$(aws configure export-credentials --profile $1 --format env)"
}

declare -A ssm_data_profile
declare -A ssm_data_instance

ssm() {
  echo "Starting session on $1"
  
  aws ssm start-session --region us-east-1 --target ${ssm_data_instance[$1]:-$1} --document-name AWS-StartInteractiveCommand --parameters command="bash"
}

alias windows='sudo grub-reboot "$(grep -i windows /boot/grub/grub.cfg | cut -d "\"" -f 2)" && sudo reboot now'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# function expand-alias() {
# 	zle _expand_alias
# 	zle self-insert
# }
# zle -N expand-alias
# bindkey -M main ' ' expand-alias
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export GPG_TTY=$TTY
export BROWSER=/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe
PATH=$HOME/.local/bin:$PATH
[[ -s "/home/vellone/.gvm/scripts/gvm" ]] && source "/home/vellone/.gvm/scripts/gvm"

[ -f ~/dotfiles/zsh/pagarme.zsh ] && source ~/dotfiles/zsh/pagarme.zsh
