autoload -U colors && colors

# Set the prompt
PS1="[%n@%m %1~]$ "

# Set History 
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set Vars
EDITOR=nvim

# Vim keybindings
bindkey -v

# Auto-complete
autoload -Uz compinit
compinit
comp_options+=(globdots) # include hidden files

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias build-config='cargo run --manifest-path /home/pika/Software/config-king/Cargo.toml -- DIRECTORY=/home/pika/Config/config.lua'
alias edit='cd /home/pika/Config'
alias vim="nvim"
alias vi="nvim"
alias sudo="sudo "
alias exert="/home/pika/Software/exert/run.sh"
alias up="sudo vpn_handler up"
alias down="sudo vpn_handler down"
alias phone="sudo macchanger -r enp9s0f3u3; nmcli con up 'Wired connection 2'&& nmcli con down 'Wired connection 1'"
alias desktop="nmcli con up 'Wired connection 1' && nmcli con down 'Wired connection 2'"

# Enable syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,underline
ZSH_HIGHLIGHT_STYLES[alias]=fg=28,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=cyan
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=063
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=063
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=214
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=214
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

# Enable Auto-suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# Enable searching for specific strings in history & add keybinds
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
