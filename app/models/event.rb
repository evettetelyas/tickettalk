# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :room, optional: true

  def formatted_date
    date&.to_datetime&.strftime('%D')
  end

  def formatted_onsale
    on_sale.to_datetime.localtime.strftime('%a %x %l:%M %p')
  end
end
