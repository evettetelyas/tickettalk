$(function() {

	$('[data-channel-subscribe="offer"]').each(function(index, element) {
		debugger
		var $element = $(element),
		  user_id = $element.data('user-id')
		  messageTemplate = $('[data-role="offer-notification-template"]');

	  // $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)

	  App.cable.subscriptions.create(
		{
		  channel: "OfferChannel",
		  user: user_id
		},
		{
		  received: function(data) {
			var content = messageTemplate.children().clone(true, true);
			content.find('[data-role="offer-message"]').text(data.message);
			$element.append(content);
			// $('.new-message-template').append(data.message)
			// $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
		  }
		}
	  );
	});
});
