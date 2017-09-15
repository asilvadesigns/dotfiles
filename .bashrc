source ~/.myalias.sh

#   FZF
export FZF_DEFAULT_OPTS='
  --color=bg+:#20242b,bg:#20242b
  --color=hl+:#61afef,hl:#61afef
  --color=fg+:#abb2bf,fg:#636d83
  --color=info:#98c379,prompt:#98c379,spinner:#98c379,pointer:#e06c75,marker:#61afef
'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#   NVM
export NVM_DIR="/Users/aas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
