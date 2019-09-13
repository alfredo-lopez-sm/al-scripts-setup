
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

function install_idea_plugin() {
    current_dir=$(pwd)
    plugin_dir=$(echo ~/Library/Application\ Support/IntelliJIdea*)

    cd "/tmp" || return

    key=$1
    url=$2
    filename=$(echo $key*.zip)
    curl -O $url
    echo "$plugin_dir"
    unzip "$filename" -d "$plugin_dir"

    echo "successfully installed "$filename
    cd "$current_dir" || return
    
    return 0
}

install_idea_plugin "lombok" "https://plugins.jetbrains.com/files/6317/67665/lombok-plugin-0.26.2-2019.2.zip"

brew cask install visual-studio-code

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