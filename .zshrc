# 文字コードの設定
export LANG=ja_JP.UTF-8

# エディタをvimに設定
export EDITOR=mvim
export VMAIL_VIM=mvim
bindkey -v



# chiner path.
export CC=cc
export gcc=cc
export CUDA_ROOT=/usr/local/cuda/
export PATH=$PATH:/usr/local/cuda/bin
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/cuda/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib
export CPATH=$CPATH:/usr/local/cuda/include
export CUDA_INC_DIR=/usr/local/cuda/bin:$CUDA_INC_DIR
export DYLD_LIBRARY_PATH=/usr/local/cuda/lib:$DYLD_LIBRARY_PATH

# パスの設定
export PATH=/usr/local/bin:$HOME/bin/:$HOME/.nodenv/bin:$PATH

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# ビープ音を鳴らさないようにする
setopt no_beep

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# ヒストリにhistoryコマンドを記録しない
setopt hist_no_store

# エイリアス
# ls
alias ls='ls -Gf'
alias la='ls -la'

alias aps="sudo apachectl start"
alias apr="sudo apachectl restart"
alias apd="sudo apachectl stop"
alias cdw="cd ~/project/"
alias dds="find ./ -name .DS_Store -print -exec rm {} ';'"
alias sudo="nocorrect sudo"
alias vim="nocorrect vim"
alias gcc="gcc-4.9"

source $HOME/.pythonbrew/etc/bashrc

if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm";
fi

if [[ -s "$HOME/.nvm/nvm.sh" ]] ; then
  source "$HOME/.nvm/nvm.sh";
  #nvm use "v0.12.2"
  #nvm use "v6.4.0"
  #nvm use "v6.10.2"
  #nvm use "v9.11.1"
fi

rvm use 2.2.2

function svn_export(){
  command sh $HOME/bin/svn_export.sh "$1" "$2" "$3"
}

# history search
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

eval "$(nodenv init -)"
