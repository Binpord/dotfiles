#/bin/sh

echo "Installing homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing yadm"
brew install yadm

echo "Loading and installing dotfiles"
yadm clone --bootstrap https://github.com/Binpord/dotfiles.git
