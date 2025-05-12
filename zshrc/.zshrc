export PATH=$PATH:/home/kabil/.local/bin
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

neofetch
# proxy stuff for vpn
export http_proxy="http://127.0.0.1:7890"
export https_proxy="http://127.0.0.1:7890"
export ftp_proxy="http://127.0.0.1:7890"
export no_proxy=""
# >>> uncomment to unset the proxy settings
# unset http_proxy
# unset https_proxy
# unset ftp_proxy
# unset all_proxy
# unset HTTP_PROXY
# unset HTTPS_PROXY
# unset FTP_PROXY
# unset ALL_PROXY
# <<< uncomment to unset the proxy settings

# Set Environment Variables for Application Scaling
# export QT_SCALE_FACTOR=0.8
# export GDK_SCALE=0.8

# GO lang
export PATH=$PATH:/usr/local/go/bin


# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "MAHcodes/distro-prompt"

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.json)"


# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)


###### env ######
# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kabil/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kabil/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kabil/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kabil/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#################

export LLVM_PROFILE_FILE="/home/kabil/profraw_files/%p.profraw"
export XCURSOR_THEME=Qogir

# Yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function c() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
		command code -- "$cwd"
	fi
	rm -f -- "$tmp"
}

ls