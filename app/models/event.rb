# frozen_string_literal: true

class Event < ApplicationRecord
  def formatted_date
    date&.to_datetime&.strftime('%D')
  end
end
