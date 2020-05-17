# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export HOST=$(hostname)

# Golang
export PATH=$PATH:/usr/local/go/bin

# Julia
export PATH="$PATH:/usr/local/julia/bin"
# Anaconda
export PATH="$HOME/anaconda3/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# export PATH="$PATH:/home/john/opt/bin"

export PATH="$HOME/anaconda3/bin:$PATH"  # commented out by conda initialize

#export GOROOT=$HOME/go
export GOPATH=$HOME/go

export GOBIN=$GOPATH/bin

# Python virtualenv
export WORKON_HOME=~/.virtualenvs

# Hadoop ssh
#export PDSH_RCMD_TYPE=ssh
#export PATH=$PATH:/home/john/hadoop-3.2.1/bin

# Hive
#export HIVE_HOME="/home/john/hive-3.2.1"
#export PATH=$PATH:$HIVE_HOME/bin

#export CLASSPATH=$CLASSPATH:$HADOOP_HOME/lib/*:.
#export CLASSPATH=$CLASSPATHL$HIVE_HOME/lin/*:

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

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

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

#source /usr/local/bin/virtualenvwrapper.sh

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

# Custom aliases
alias git-ssh='eval "$(ssh-agent -s)"; ssh-add ~/.ssh/id_rsa'
alias python='python3'
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias pip-update='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | sudo xargs pip install -U'
alias vi='vim'
alias commit='git commit' #cause i keep forgetting to type git
alias pip='python -m pip'
#alias python='/usr/bin/python3'
#alias python3='/usr/bin/python3'

eval $(thefuck --alias)

# Command execution time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Plugins to load
plugins=(
        git
	golang
        docker
#        pygmalion-virtualenv
#		autoswitch_virtualenv
	zsh-completions
        zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/john/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/home/john/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/john/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/john/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

