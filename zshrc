# This config requires that brew and oh-my-zsh be installed on this machine.
# brew installation: https://github.com/Homebrew/brew
# Oh my zsh: https://ohmyz.sh/#install

# Uncomment these lines if running on new machines.
# export PATH=/home/linuxbrew/.linuxbrew/bin/:$PATH
# brew list | grep gnu-sed > /dev/null || brew install gnu-sed
# brew list | grep neovim > /dev/null || brew install neovim
# brew list | grep starship > /dev/null || brew install starship  # https://starship.rs/
# brew list | grep coreutils > /dev/null || brew install coreutils
# brew list | grep fzf > /dev/null || brew install fzf

export ZSH="$HOME/.oh-my-zsh"
export VI_MODE_SET_CURSOR=true
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR="vim"
export ARCHFLAGS="-arch x86_64"  # Compilation flags
export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting z vi-mode)
autoload -U compinit && compinit
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh
bindkey jk vi-cmd-mode

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
