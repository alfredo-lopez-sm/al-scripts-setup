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