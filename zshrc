##################### set  PATH ##################### 
export PATH=/sbin:/bin:/usr/bin:/usr/sbin:/usr/local/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:~/.yarn/bin
export PATH=$PATH:/usr/local/protobuf/bin
export PATH=$PATH:~/.cargo/bin

##################### oh-my-zsh config ##################### 
export ZSH="/Users/liubo/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    Z 
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src


##################### github proxy ##################### 
git config --global http.https://github.com.proxy http://127.0.0.1:10080


##################### brew mirror  ##################### 
# 修改BOTTLE源为中科大的云镜像
if [[ "$(uname -s)" == "Linux" ]]; then BREW_TYPE="linuxbrew"; else BREW_TYPE="homebrew"; fi
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/${BREW_TYPE}-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/${BREW_TYPE}-bottles/bottles"


##################### pyenv ##################### 
# python 相关的配置，python全部使用pyenv来管理，不能brew install python3
export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
# 这两句一定要加上，pyenv 是一个函数，主要是把~/.pyenv/shims 加到$PATH里面
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


##################### fzf  ##################### 
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


##################### alias  ##################### 
alias stock='python3.9 /Users/liubo/PycharmProjects/stock/stock.py'
alias ss='python3.9 /Users/liubo/PycharmProjects/stock/stock.py'
alias reload='source ~/.zshrc'


##################### golang evn ##################### 
export GO111MODULE=on
export GOPROXY=https://goproxy.io
# fix sum.golang.org request timeout 
go env -w GOSUMDB=sum.golang.google.cn


##################### npm env ##################### 
# 修改npm为国内源
npm config set registry=http://registry.npm.taobao.org

# 修改npm为国内源
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


##################### java env ##################### 
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_321.jdk/Contents/Home


##################### bind key ##################### 
bindkey ',' autosuggest-accept

