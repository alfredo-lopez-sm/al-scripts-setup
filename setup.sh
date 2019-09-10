
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew update

# Install java
brew cask install java11

# Install git
brew install git
git config --global user.name "Alfredo Lopez"
git config --global user.email "a.lopez@searchmetrics.com"


# Install build tools
brew install maven
brew install gradle


# Install ides
brew cask install intellij-idea
brew cask install visual-studio-code

# Install docker
brew cask install docker

# Install scala and spark
brew install scala
brew cask install homebrew/cask-versions/adoptopenjdk8
brew install apache-spark