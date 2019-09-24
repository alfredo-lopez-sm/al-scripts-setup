#!/bin/bash

# Load helper functions
. helpers.sh

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew tap adoptopenjdk/openjdk
brew update

# Install git
brew install git
git config --global user.name "Alfredo Lopez"
git config --global user.email "a.lopez@searchmetrics.com"


# Install languages
brew cask install caskroom/versions/adoptopenjdk8
brew install php

# Install build tools
brew install maven
brew install gradle


# Install ides
brew cask install visual-studio-code
brew cask install intellij-idea


install_idea_plugin "lombok" "https://plugins.jetbrains.com/files/6317/67665/lombok-plugin-0.26.2-2019.2.zip"
install_idea_plugin "php-192" "https://plugins.jetbrains.com/files/6610/68675/php-192.6603.42.zip"
install_idea_plugin "python" "https://plugins.jetbrains.com/files/631/68553/python.zip"
install_idea_plugin "scala-intellij" "https://plugins.jetbrains.com/files/1347/68482/scala-intellij-bin-2019.3.3.zip"
install_idea_plugin "SonarLint" "https://plugins.jetbrains.com/files/7973/68167/SonarLint-4.1.1.3345.zip"
install_idea_plugin "sonar-intellij-plugin" "https://plugins.jetbrains.com/files/7238/68250/sonar-intellij-plugin-2.8.1.zip"
install_idea_plugin "aws-jetbrains-toolkit" "https://plugins.jetbrains.com/files/11349/69239/aws-jetbrains-toolkit-1.6.zip"
install_idea_plugin "a5ec0c618c4e8ff5" "https://plugins.jetbrains.com/files/7371/67781/a5ec0c618c4e8ff5-0.6.14.zip"

# Install the template for the code standards
install_idea_template


# Install AWS toolkit and configure it for aws
brew tap aws/tap
brew install  aws/tap/aws-sam-cli
configure_aws_toolkit


# Install docker
brew cask install docker

# Install scala and spark
brew install scala
brew cask install homebrew/cask-versions/adoptopenjdk8
brew install apache-spark


# Install awscli
brew install awscli

# Install travis
brew install travis

# Install completions
brew install bash-completion@2

# Install encription
brew install gnupg
brew cask install gpg-suite

# Install openfortivpn, It has to be manually installed by the prompt
brew cask install forticlient
open /usr/local/Caskroom/forticlient/*/FortiClientUpdate.ap