$(function() {
	$('[data-channel-subscribe="notification"]').each(function(index, element) {
	  var $element = $(element),
		  room_id = $element.data('room-id')
		  messageTemplate = $('[data-role="notification-template"]');

	  // $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)

	  App.cable.subscriptions.create(
		{
		  channel: "NotficationChannel",
		  user: current_user
		},
		{
		  received: function(data) {
			var content = messageTemplate.children().clone(true, true);
			content.find('[data-role="offer-message"]').text(data.message);
			// $element.append(content);
			// $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
		  }
		}
	  );
	});
});
