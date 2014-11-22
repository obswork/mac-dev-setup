# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# update the $PATH in your ~/.bash_profile
echo '$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH' >> ~/.bash_profile
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile


echo "installing binaries..."
binaries=(
  python3
  python
  tree
  git
)
brew install ${binaries[@]}
brew cleanup

#### Installing Apps with Homebrew Cask

brew install caskroom/cask/brew-cask

echo "installing apps..."
apps=(
  onepassword
  alfred
  appcleaner
  caffeine
  copy
  daisydisk
  dash
  dropbox
  evernote
  flux
  google-chrome
  hazel
  iterm2
  mailbox
  nvalt
  omnifocus
  shiori
  sketch
  skim
  slack
  spectacle
  sublime-text3
  textexpander
  tower
  transmission
  vlc
  zotero
  qlmarkdown
  qlstephen
  quicklook-json
)
# Install apps to /Applications
# Default is: /Users/$user/Applications
brew cask install --appdir="/Applications" ${apps[@]}

# access to betas
brew tap caskroom/versions

# link Alfred to cask apps
brew cask alfred link

# install fonts
brew tap caskroom/fonts

# install mackup
pip install mackup

# restore your old preferences
mackup restore
