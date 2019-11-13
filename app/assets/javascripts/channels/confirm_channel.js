$(function() {

	$('[data-channel-subscribe="confirm"]').each(function(index, element) {
		debugger
		var $element = $(element),
		  user_id = $element.data('user-id')
		  messageTemplate = $('[data-role="confirm-notification-template"]');

	  App.cable.subscriptions.create(
		{
		  channel: "ConfirmChannel",
		  user: user_id
		},
		{
		  received: function(data) {
			$('.confirm-message-template').append(data.confirm_message)
		  }
		}
	  );
	});
});
