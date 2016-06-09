function fish_prompt
  printf '%s%s%s >%s ' (set_color cyan) (prompt_pwd) (set_color white) (set_color normal)
end

function fish_greeting
  echo "Running tmux sessions:"
  tmux ls
end

function export
  if [ $argv ]
    set var (echo $argv | cut -f1 -d=)
    set val (echo $argv | cut -f2 -d=)
    set -g -x $var $val
  else
    echo 'export var=value'
  end
end

# cli
abbr 'll' 'ls -lah'

# git
abbr 'gc' 'git commit -v'
abbr 'gb' 'git branch'
abbr 'ga' 'git add'
abbr 'gst' 'git status'
abbr 'gco' 'git checkout'
abbr 'gd' 'git diff'
abbr 'gdc' 'git diff --cached'
abbr 'glol' "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# tmux
alias 'tn' 'tmux new-session -A -s '
alias 'tna' 'tmux new-session -A -s (basename $PWD | tr . -)'
alias 'tl' 'tmux ls'

# docker
alias 'fig' 'docker-compose'

set -U EDITOR (which vim)

# docker based functions
function run-docker
  if test (count $argv) -gt 2
    set cmd $argv[3..-1]
  end
  docker run -t -i --rm -v (pwd):/app -w /app --entrypoint $argv[1] $argv[2] $cmd
end

function mix
  run-docker mix msaraiva/elixir:1.2.2 $argv
end

function iex
  run-docker iex msaraiva/elixir:1.2.2 $argv
end

function irb
  run-docker irb ruby:2.3
end

function ruby
  run-docker ruby ruby:2.3
end

function lein
  run-docker lein clojure:latest
end

function remove-git-submodule
  set name $argv[1]
  git submodule deinit $name
  git rm $name
  rm -rf .git/modules/$name
end

if test -f $HOME/.custom.fish
  source $HOME/.custom.fish
end
