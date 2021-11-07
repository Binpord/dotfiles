#/bin/sh

echo "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing yadm"
brew install yadm

echo "Loading and installing dotfiles"
yadm clone --bootstrap https://github.com/Binpord/dotfiles.git
