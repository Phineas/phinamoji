var Twitter = require('twitter');

var client = new Twitter({
  consumer_key: 'YourConsumerKey',
  consumer_secret: 'YourConsumerSecret',
  access_token_key: 'YourAccessTokenKey',
  access_token_secret: 'YourAccessTokenSecret'
});

var originalScreenName = 'Phineas';
var emojiTypes = ['🔮', '🌊', '💠', '🔷',  '☄',  '💧', '❄️']; // Add your emojis to the array here

function updateEmoji() {
  var randomEmoji = emojiTypes[Math.floor(Math.random()*emojiTypes.length)];
  
  client.post('account/update_profile', {name: originalScreenName + ' ' + randomEmoji}, function(error, name, response) {
    if(error) throw error;
    console.log("Changed name to: " + originalScreenName + ' ' + randomEmoji); //Remove this if you wish, this is just for debugging
  });
}
setInterval(updateEmoji, 60 * 1000);

updateEmoji();
