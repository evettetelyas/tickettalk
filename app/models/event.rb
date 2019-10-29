class Event < ApplicationRecord

    def formatted_date
        date.to_datetime.strftime('%D') if date
    end
end

