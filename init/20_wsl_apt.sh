# WSL-only stuff. Abort if not WSL.
is_wsl || return 1

# Update APT.
e_header "Updating APT"
sudo apt -qq update

# Install APT packages.
packages=(
  build-essential
  emacs-nox
  git-core
  tmux
  tree
  zsh
)

packages=($(setdiff "${packages[*]}" "$(dpkg --get-selections | grep -v deinstall | awk '{print $1}')"))

if (( ${#packages[@]} > 0 )); then
  e_header "Installing APT packages: ${packages[*]}"
  for package in "${packages[@]}"; do
    sudo apt -qq install "$package"
  done
fi

# Install Git Extras
if [[ ! "$(type -P git-extras)" ]]; then
  e_header "Installing Git Extras"
  (
    cd $DOTFILES/vendor/git-extras &&
    sudo make install
  )
fi
