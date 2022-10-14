#!/home/coolpants/.nix-profile/bin/fish

# install nix packages
if which tig > /dev/null; and which tmux > /dev/null; and which yarn > /dev/null; and which fzf > /dev/null; and which rg > /dev/null; and which bat > /dev/null;
 and which direnv > /dev/null; and which exa > /dev/null; and which peco > /dev/null; and which ghq > /dev/null; and which python3 > /dev/null;
 echo "All packages already installed..."
else
  nix-env -iA \
	nixpkgs.tig\
	nixpkgs.fish\
	nixpkgs.tmux\
	nixpkgs.yarn\
	nixpkgs.fzf\
	nixpkgs.ripgrep\
	nixpkgs.bat\
	nixpkgs.direnv\
	nixpkgs.exa\
	nixpkgs.peco\
	nixpkgs.ghq\
	nixpkgs.python3Full
end

# add fish to valid login shells
command -v fish | sudo tee -a /etc/shells

# use fish as default shell
sudo chsh -s $(which fish) $USER

# stow fish config
rm -rf ~/.config/fish/config.fish
stow fish


# Install fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# Install Fisher libraries
fisher install jethrokuan/z
fisher install IlanCosman/tide
fisher install edc/bass
