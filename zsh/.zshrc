# If you come from bash you might have to change your $PATH.
export PATH=$HOME/opt/homebrew/bin/brew:$HOME/bin:/usr/local/bin:$PATH:/Users/kevincasado/Library/Python/3.10/bin:/Users/kcasado/.cargo/bin
alias zrs="source ~/.zshrc"
export XDG_CONFIG_HOME=~/.config
alias ssh="TERM=xterm ssh"
alias gs="git status"
alias gr="git fetch; git rebase -i origin/main"
alias gR="git fetch; git rebase -i origin/master"
alias gpf="git push origin --force"
alias gpo="git push origin"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
alias k="kubectl"
export KO_DOCKER_REPO='docker.io/kwould'
alias pvenv=create_virtualenv
alias cvenv="source .venv/bin/activate"
function create_virtualenv {
	echo "creating virtualenv"
	python3 -m venv .venv
	source .venv/bin/activate
	if [ -f "requirements.txt" ]; then
		echo "installing requirements for package"
		pip install -r requirements.txt
	fi

}
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
export PATH=$GOPATH:$PATH
# aliases
ZSH_THEME="robbyrussell"

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
# Set list of themes to pick from when loading at random
#
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

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
SSH_ENV="$HOME/.ssh/environment"
# source workrc if exists
if [ -f "$HOME/.workrc" ]; then
	source $HOME/.workrc
fi

eval `ssh-agent -s`
ssh-add
ssh-add --apple-use-keychain;
ssh-add --apple-load-keychain;
manage_brew_service () {
	is_running=$(brew services list | grep $1 | awk '{ print $2}')
	if [ "$is_running" = "started" ]; then
		echo "Not starting $1 because it's already running"
	else
		brew services start $1
	fi
}
# homebrew services
# manage_brew_service "yabai"
# manage_brew_service "skhd"
# source workrc if exists
if [ -f "$HOME/.personalrc" ]; then
	source $HOME/.personalrc
fi
export DOTFILE_LOC="~/dotfiles"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kcasado/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
akhqup='pushd ~/Desktop && docker-compose up -d --build && popd'
akhqopen='open http://localhost:8080'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
