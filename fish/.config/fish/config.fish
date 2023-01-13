if not pgrep --full ssh-agent | string collect > /dev/null
  eval (ssh-agent -c)
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

if type -q exa
	alias ll "exa -l -g --icons"
	alias lla "ll -a"
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

if [ -e /home/coolpants/.nix-profile/etc/profile.d/nix.sh ]
	. /home/coolpants/.nix-profile/etc/profile.d/nix.fish
end # added by Nix installer

set fish_greeting ""

set -gx PATH ~/.local/bin/neovim/bin $PATH
set -gx PATH ~/pycharm/bin $PATH

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set LC_ALL en_IN.UTF-8
set LANG en_IN.UTF-8

# aliases
command -qv nvim && alias vim nvim
alias cls clear
alias kts "tmux kill-session -t"
alias sp "source env/bin/activate.fish"
alias postman "/home/coolpants/Postman/Postman"

set -gx EDITOR nvim


set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
set -gx GO111MODULE on

# Rust
set -gx PATH $HOME/.cargo/bin $PATH

# NVM( check if node is installed, if no then install, if yes then use latest node version or one specified in .nvmrc )
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return
  if which node > /dev/null
    if test -f .nvmrc; and test -r .nvmrc;
      nvm use
    else
    end
  else
  end
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
