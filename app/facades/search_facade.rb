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
			event[:tm_id] = event[:id]
			event.delete(:id)
			Event.create(event)
		end
	end
end