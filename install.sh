# install packages
sudo apt update
sudo apt install curl bsdextrautils xz-utils vim -y

# install nix
sh< (curl -L https://nixos.org/nix/install) --no-daemon

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.tig\
	nixpkgs.fish\
	nixpkgs.neovim\
	nixpkgs.tmux\
	nixpkgs.stow\
	nixpkgs.yarn\
	nixpkgs.fzf\
	nixpkgs.ripgrep\
	nixpkgs.bat\
	nixpkgs.direnv\
	nixpkgs.exa\
	nixpkgs.peco\
	nixpkgs.ghq\
	nixpkgs.python3Full

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# add fish to valid login shells
command -v fish | sudo tee -a /etc/shells

# use fish as default shell
sudo chsh -s $(which fish) $USER

# Install fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# Install Node Version Manager(NVM)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Install Fisher libraries
fisher install jethrokuan/z
fisher install IlanCosman/tide

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Dotfiles setup with stow
rm -rf ~/.config/fish/config.fish
stow fish

# Install node
nvm install node
