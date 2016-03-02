# cli
alias 'll' 'ls -lah'

# git
alias 'gc' 'git commit -v'
alias 'ga' 'git add'
alias 'gst' 'git status'
alias 'gco' 'git checkout'
alias 'gd' 'git diff'
alias 'gdc' 'git diff --cached'
alias 'glol' "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# docker
alias 'fig' 'docker-compose'

if test -f $HOME/.custom.fish
  source $HOME/.custom.fish
end
