# phinamoji
Simple NodeJS script to change your Twitter name's emoji every few seconds

## Requirements
* NodeJS 5+
* Git
* NPM

## Setup
Clone the project: `git clone https://github.com/Phineas/phinamoji.git` into the directory you wish
##### (You can now use the installation script by using `bash setup.sh` in the directory, but if you'd like to install manually, follow the instructions below)

1. Install the NPM twitter package using `npm install twitter`
2. Create a Twitter application at https://apps.twitter.com and make sure you have a consumer, consumer secret, access token & access secret
3. Edit namoji.js - change the consumer & access keys to whatever yours are
4. Change the originalScreenName to whatever your Twitter name is
5. Add/remove emojis you wish from the array & save the file
6. Run the script with `node namoji.js`

## Other
Create an issue/pr for any bugs!
