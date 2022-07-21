export PATH=${GOPATH//://bin:}/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/leonaves/.oh-my-zsh"

ZSH_THEME="bullet-train"

BULLETTRAIN_CONTEXT_BG="8"
BULLETTRAIN_PROMPT_CHAR=➜
BULLETTRAIN_EXEC_TIME_ELAPSED=0

BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    dir
    screen
    perl
    ruby
    virtualenv
    nvm
    aws
    go
    rust
    elixir
    git
    hg
    cmd_exec_time
)

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# This prints the directory in the tab window in iTerm
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

alias dio='doctl --context lemonarc'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/leonaves/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/leon/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/leonaves/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/leonaves/google-cloud-sdk/completion.zsh.inc'; fi

alias kubetoken="kubectl get secret -n kube-system -o json | jq '.items[] | select(.metadata.name|test(\"leon.*\")) | .data.token' -r | base64 -D | pbcopy"

export GOPATH="$HOME/go"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias allsites="doctl compute droplet list --output json | jq -r '.[] | [.name, .networks.v4[0].ip_address] | @tsv' | while IFS=$'\t' read -r name ip; do echo \"$name $ip\" && ssh root@\"$ip\" 'ls -la /var/www' < /dev/null; done"

export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"

source <(kubectl completion zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
