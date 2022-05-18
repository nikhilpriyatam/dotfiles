# This config requires that brew be installed on the machine.
# brew installation: https://github.com/Homebrew/brew

export PATH=/home/linuxbrew/.linuxbrew/bin/:$PATH
export VI_MODE_SET_CURSOR=true
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR="vim"
export ARCHFLAGS="-arch x86_64"  # Compilation flags
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"
export ZPLUG_HOME=$(brew --prefix)/opt/zplug

brew list | grep zplug > /dev/null || brew install zplug
brew list | grep gnu-sed > /dev/null || brew install gnu-sed
brew list | grep neovim > /dev/null || brew install neovim
brew list | grep starship > /dev/null || brew install starship  # https://starship.rs/
brew list | grep coreutils > /dev/null || brew install coreutils

source $ZPLUG_HOME/init.zsh
#zplug bundle git
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "agkozak/zsh-z"
zplug "jeffreytse/zsh-vi-mode"

if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"
MINICONDA_HOME=$HOME/miniconda3/
TOOLBOX_HOME=$HOME/.toolbox/
ZSH_HIGHLIGHT_STYLES[comment]="none"

# Example aliases
alias vim="nvim"
alias sed="gsed"
alias ls="gls --color -h --group-directories-first"
alias bb="brazil-build"
alias ipython="ipython --TerminalInteractiveShell.editing_mode=vi"
export PATH=$MINICONDA_HOME/bin:$TOOLBOX_HOME/bin:$PATH
# export PATH=$PATH:$HOME/.odin-tools/env/OdinRetrievalScript-1.0/runtime/bin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
