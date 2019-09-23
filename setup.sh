
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

# Installs plugins in the ide
function install_idea_plugin() {
    current_dir=$(pwd)
    plugin_dir=$(echo ~/Library/Application\ Support/IntelliJIdea*)

    cd "/tmp" || return

    key=$1
    url=$2
    filename=$(echo $key*.zip)
    curl -O "$url"
    echo "$plugin_dir"
    unzip "$filename" -d "$plugin_dir"

    echo "successfully installed $filename"
    cd "$current_dir" || return

    return 0
}

install_idea_plugin "lombok" "https://plugins.jetbrains.com/files/6317/67665/lombok-plugin-0.26.2-2019.2.zip"
install_idea_plugin "php-192" "https://plugins.jetbrains.com/files/6610/68675/php-192.6603.42.zip"
install_idea_plugin "python" "https://plugins.jetbrains.com/files/631/68553/python.zip"
install_idea_plugin "scala-intellij" "https://plugins.jetbrains.com/files/1347/68482/scala-intellij-bin-2019.3.3.zip"
install_idea_plugin "SonarLint" "https://plugins.jetbrains.com/files/7973/68167/SonarLint-4.1.1.3345.zip"
install_idea_plugin "sonar-intellij-plugin" "https://plugins.jetbrains.com/files/7238/68250/sonar-intellij-plugin-2.8.1.zip"

# Adds the code formatting
function install_idea_template() {
    current_dir=$(pwd)
    style_dir=$(echo ~/Library/Preferences/IntelliJIdea*/codestyles)
    options_dir=$(echo ~/Library/Preferences/IntelliJIdea*/options)
    style_name=Searchmetrics

    cd "/tmp" || return

    rm -rf "java-code-style"
    git clone git@github.com:searchmetrics/java-code-style.git

    rm "$style_dir/Searchmetrics.xml"
    cp  "java-code-style/src/main/resources/code_style_templates.xml" "$style_dir/$style_name.xml"

    content='<application> \n
      <component name="CodeStyleSettingsManager"> \n
        <option name="PER_PROJECT_SETTINGS"> \n
          <value version="173" /> \n
        </option> \n
        <option name="PREFERRED_PROJECT_CODE_STYLE" value="'$style_name'" /> \n
        </component> \n
      </application>'

    echo -e $content > "$options_dir/code.style.schemes"

    cd "$current_dir" || return

    return 0
}
install_idea_template


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

# Install openfortivpn, It has to be manually installed by the prompt
brew cask install forticlient
open /usr/local/Caskroom/forticlient/*/FortiClientUpdate.ap