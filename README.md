# Dotfiles

This is my repository for dotfiles. It is supposed to work with [Yet Another Dotfiles Manager](https://yadm.io) so in order to make it work as intended, user must do as follows:
1. Install yadm (I am running macOS and using [homebrew](https://brew.sh)).
2. Clone this repository with `yadm clone --bootstrap https://github.com/Binpord/dotfiles.git` (or without bootstrap if you want).

In order to minimize the effort I added installation script (located in `tools/install.sh`), so if you are running macOS, you can setup my dotfiles as simple as
```
sh -c "curl -fsSL https://raw.githubusercontent.com/Binpord/dotfiles/master/tools/install.sh"
```
Script currently supports **only macOS**, but I will probably add support for linux distributions when the time comes.