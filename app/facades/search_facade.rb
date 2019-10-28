class SearchFacade
	attr_reader :keyword
	
	def initialize(keyword)
		@keyword = keyword
	end

	def service
		DiscoService.new
	end

	def event_data
		service.search_events(@keyword)
	end

	def events
		event_data[:events].map do |event|
			Event.new(event)
		end
	end
end