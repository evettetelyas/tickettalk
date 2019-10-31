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

  def sort(sort_type)
    [sort_type ? 0 : 1, sort_type || nil]
  end

  def events
    if @sort == 'date_asc'
      create_events.sort_by { |event| sort(event.date) }
    elsif @sort == 'price_asc'
      create_events.sort_by { |event| sort(event.price_max) }
    elsif @sort == 'onsale_asc'
      create_events.sort_by { |event| sort(event.on_sale) }
    else
      create_events
    end
  end
end
