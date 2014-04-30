PrivatePub.subscribe("/messages/new", function(data, channel) {
  console.log(data.chat_message);
  $("#chat").append(data.chat_message);
});