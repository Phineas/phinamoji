#!/usr/bin/env bash

scmd="sed"

npmLinux() {
    sysver=$(gawk -F= '/^NAME/{print $2}' /etc/os-release)
    if [[ sysver=="Ubuntu" ]]; then
        sudo apt-get -y install python-software-properties
        curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
        sudo apt-get -y install nodejs
    elif [[ "$(gawk -F= '/^NAME/{print $2}' /etc/os-release)" == "CentOS" ]]; then
        sudo curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -
        sudo yum -y install nodejs
    else
        echo "Sorry, we couldn't find a way to install NPM/Node on your machine at this time."
        exit
    fi

    npm install twitter
}

if [ "$(uname)" == "Darwin" ]; then
    command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }
    brew install gnu-sed
    scmd="gsed"

    command -v npm >/dev/null 2>&1 || { echo >&2 "Installing NPM & Node Now"; \
    brew install node; }

    npm install twitter
else
    command -v npm >/dev/null 2>&1 || { echo >&2 "Installing NPM & Node Now"; \
    npmLinux ;}
fi

echo "Create a Twitter application at https://apps.twitter.com and make sure you have a consumer, consumer secret, access token & access secret"

echo -n "Consumer Key> "
read consumer
$scmd -i 's/YourConsumerKey/'"$consumer"'/g' namoji.js
echo "Set consumer_key to $consumer"

echo -n "Consumer Secret> "
read consumersecret
$scmd -i 's/YourConsumerSecret/'"$consumersecret"'/g' namoji.js
echo "Set consumer_secret to $consumersecret"

echo -n "Access Token> "
read access
$scmd -i 's/YourAccessTokenKey/'"$access"'/g' namoji.js
echo "Set access_token_key to $access"

echo -n "Access Token Secret> "
read accesssecret
$scmd -i 's/YourAccessTokenSecret/'"$accesssecret"'/g' namoji.js
echo "Set access_token_secret to $accesssecret"

echo "All set up! You can now start by using node namoji.js"
