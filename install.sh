# install packages
sudo apt update
sudo apt install fish git stow bsdextrautils xz-utils vim -y

# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# add fish to valid login shells
command -v fish | sudo tee -a /etc/shells

# use fish as default shell
sudo chsh -s $(which fish) $USER

# stow fish config
rm -rf ~/.config/fish/config.fish
stow fish

# install nvim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar xzvf nvim-linux64.tar.gz
mv nvim-linux64 ./.local/bin/neovim

# Install fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Dotfiles setup with stow
rm -rf ~/.config/fish/config.fish
stow fish

# Install fisher
fish ~/.dotfiles/fisher.fish

# Install packer
fish ~/.dotfiles/packer.fish

# stow nvim config
rm -rf ~/.config/nvim
stow nvim
