class MyEventsFacade
	def initialize(current_user)
	  @user = current_user
	end
  
	def archive
	  @user.rooms
	end
end