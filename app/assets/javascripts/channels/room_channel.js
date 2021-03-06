$(function() {
	$('[data-channel-subscribe="room"]').each(function(index, element) {
	  var $element = $(element),
		  room_id = $element.data('room-id')
		  messageTemplate = $('[data-role="message-template"]');

	  $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)

	  App.cable.subscriptions.create(
		{
		  channel: "RoomChannel",
		  room: room_id
		},
		{
		  received: function(data) {
			var content = messageTemplate.children().clone(true, true);
			content.find('[data-role="user-username"]').attr('href', data.username_url).text(data.username);
			content.find('[data-role="css-type"]').attr('class', data.css_type);
			content.find('[data-role="message-text"]').text(data.message);
			content.find('[data-role="message-date"]').text(data.timestamp);
			$element.append(content);
			$element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
		  }
		}
	  );
	});
});
