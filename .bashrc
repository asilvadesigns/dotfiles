#   $DIRECTORIES

#   GENERAL
alias gohome='cd ~'
alias godesktop='cd ~/Desktop'
alias godotfiles='cd ~/Desktop/Github/dotfiles/'
alias goexperiments='cd ~/Desktop/Experiments/'

#   PERSONAL
alias gobunnies='cd ~/Desktop/Experiments/FightTheBunnies'
alias gogithub='cd ~/Desktop/Github'
alias gosites='cd ~/Sites'

#   VIM
alias vim='/usr/local/Cellar/vim/8.0.0160/bin/vim'
alias govimrc='mvim ~/.vimrc'

#   TELLUS
alias gotellus='cd ~/Sites/tellusapts.com'
alias gotelluscode='cd ~/Sites/tellusapts.com/wp-content/themes/uncode-child'
alias buildtelluscode='cd ~/Sites/tellusapts.com/wp-content/themes/uncode-child/assets && gulp'
alias nvimtelluscode='cd ~/Sites/tellusapts.com/wp-content/themes/uncode-child && nvim'

#   VYV
alias govyv='cd ~/Sites/vyvapts.com'
alias govyvcode='cd ~/Sites/vyvapts.com/wp-content/themes/uncode-child'
alias buildvyvcode='cd ~/Sites/vyvapts.com/wp-content/themes/uncode-child/assets && gulp'
alias nvimvyvcode='cd ~/Sites/vyvapts.com/wp-content/themes/uncode-child && nvim'


export FZF_DEFAULT_OPTS='
  --color=bg+:#20242b,bg:#20242b
  --color=hl+:#61afef,hl:#61afef
  --color=fg+:#abb2bf,fg:#636d83
  --color=info:#98c379,prompt:#98c379,spinner:#98c379,pointer:#e06c75,marker:#61afef
'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="/Users/aas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
