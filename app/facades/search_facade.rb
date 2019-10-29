# frozen_string_literal: true

class SearchFacade
	attr_reader :keyword
	
	def initialize(keyword, sort)
		@keyword = keyword
		@sort = sort
	end

  def service
    DiscoService.new
  end

  def event_data
    service.search_events(@keyword)
  end

	def create_events
		event_data[:events].map do |event|
			event[:tm_id] = event[:id]
			event.delete(:id)
			Event.create(event)
		end
	end

	def events
		if @sort == 'date_asc'
			create_events.sort_by { |event| [event.date ? 0 : 1,event.date || nil] }
		elsif @sort == 'price_asc'
			create_events.sort_by { |event| [event.price_max ? 0 : 1,event.price_max || nil] }
		elsif @sort == 'onsale_asc'
			create_events.sort_by { |event| [event.on_sale ? 0 : 1,event.on_sale || nil] }
		else
			create_events
		end
	end
end

