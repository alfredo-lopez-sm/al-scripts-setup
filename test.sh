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
configure_aws_toolkit