alias tree='tree --dirsfirst -F'
alias c=clear
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias vim=nvim
alias vi=nvim
alias lg=lazygit
alias rr=ranger
alias sudo='sudo -E'
alias ssh="kitty +kitten ssh"

# eval $(thefuck --alias)

# git alias
alias gco='git checkout'
alias gpo='git push origin $(git symbolic-ref --short -q HEAD)'
alias gpl='git pull origin $(git symbolic-ref --short -q HEAD) --ff-only'
alias gd='git --no-pager diff'
alias gs='git --no-pager status'
alias gss='git --no-pager status -s'
alias gpt='git push origin --tags'
alias glt='git tag -n --sort=taggerdate | tail -n ${1-10}'

alias waybar="bash ~/.script/waybar-restart.sh &"
