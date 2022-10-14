# install packages
sudo apt update
sudo apt install unzip git gcc g++ g++-10-powerpc64-linux-gnu make cmake stow bsdextrautils xz-utils vim -y

# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

. ~/.nix-profile/etc/profile.d/nix.sh

# install nvim
{
  rm -rf ~/.local/bin/neovim
} || 
{
  echo "no neovim"
}
distro=$(cat /etc/issue)
if [[ "$distro" == *"Debian"* ]]; then
  url=https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.deb
else
  url=https://github.com/neovim/neovim/releases/download/v0.8.0/nvim-linux64.tar.gz
fi
wget $url
if [[ "$distro" == *"Debian"* ]]; then
  sudo apt install ./nvim-linux64.deb
else
  tar xzvf nvim-linux64.tar.gz
  mkdir ~/.local/bin
  mv nvim-linux64 ~/.local/bin/neovim
fi

# Install fonts
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Dotfiles setup with stow
rm -rf ~/.config/fish/config.fish
stow fish


# Install packer
fish ~/.dotfiles/packer.fish

# stow nvim config
rm -rf ~/.config/nvim
stow nvim

echo "Basic setup finished!! You can now start fish and run fisher.fish"
