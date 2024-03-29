#!/bin/bash

# Load helper functions
source helpers.sh

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew tap adoptopenjdk/openjdk
brew update

# Install git
brew install git
git config --global user.name "Alfredo Lopez"
git config --global user.email "a.lopez@searchmetrics.com"

# Install java
brew cask install caskroom/versions/adoptopenjdk8
brew install jenv

# Install build tools
brew install maven
brew install gradle

# Install ides
brew cask install visual-studio-code
brew cask install intellij-idea

install_idea_plugin "lombok" "https://plugins.jetbrains.com/files/6317/67665/lombok-plugin-0.26.2-2019.2.zip"
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
brew install aws/tap/aws-sam-cli
configure_aws_toolkit

# Install docker and composer
brew cask install docker
brew install composer

# Install scala and spark
brew install scala
brew cask install adoptopenjdk/openjdk/adoptopenjdk8
brew install apache-spark

# Install awscli
brew install awscli

# Install travis
brew install travis

# Install completions
brew install bash-completion@2

# Install encryption
brew install gnupg

# Install elastic search
brew tap elastic/tap
brew install elastic/tap/elasticsearch-full
brew install elastic/tap/kibana-full

# Install mysqlworkbench cuz sqlpro is a $#$%$ :)
brew cask install mysqlworkbench

# Install php stuff
brew install php
brew install composer
curl -sS https://get.symfony.com/cli/installer | bash
install_idea_plugin "php-192" "https://plugins.jetbrains.com/files/6610/68675/php-192.6603.42.zip"
install_idea_plugin "idea-php-annotation-plugin" "https://plugins.jetbrains.com/files/7320/68232/idea-php-annotation-plugin-6.2.1.zip"
install_idea_plugin "composer-json-plugin-proguard" "https://plugins.jetbrains.com/files/7631/64192/composer-json-plugin-proguard.zip"
install_idea_plugin "phpstorm-docker" "https://plugins.jetbrains.com/files/8595/69467/phpstorm-docker.zip"
install_idea_plugin "PhpInspectionsEA" "https://plugins.jetbrains.com/files/7622/69570/PhpInspectionsEA.jar"
install_idea_plugin "phpstorm-remote-interpreter" "https://plugins.jetbrains.com/files/7511/69468/phpstorm-remote-interpreter.zip"
install_idea_plugin "twig" "https://plugins.jetbrains.com/files/7303/69469/twig.zip"
install_idea_plugin "symfony-plugin" "https://plugins.jetbrains.com/files/7219/69177/symfony-plugin-0.19.184.zip"


# Link the file to the bash profile
touch "$HOME/.zshrc"
echo "Do the linking by hand otherwise it will not work"
echo "ln -sF $HOME/IdeaProjects/al-scripts-setup-master/zshrc $HOME/.zshrc"
source "$HOME/.zshrc"

# Install openfortivpn, It has to be manually installed by the prompt
prompt "You need to install the vpn manually"