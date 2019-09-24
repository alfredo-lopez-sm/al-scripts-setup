#!/bin/bash

##################################
# Helper functions needed to run #
##################################

# Configure the aws tool kit
function configure_aws_toolkit() {

    options_dir=$(echo ~/Library/Preferences/IntelliJIdea*/options)

    content='<application> \n
              <component name="aws"> \n
                <option name="promptedForTelemetry" value="true" /> \n
                <option name="telemetryEnabled" value="false" /> \n
              </component> \n
              <component name="sam"> \n
                <option name="savedExecutablePath" value="/usr/local/bin/sam" /> \n
              </component> \n
            </application>'

    echo -e $content > "$options_dir/aws.xml"

    return 0
}

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