require 'rails_helper'

describe Event do
  describe 'instance methods' do
    it '#formatted_date formats the event date' do
      event = create(:event)

      expect(event.formatted_date).to_not eq(event.date)
    end

    it '#formatted_onsale formats the onsale date' do
      event = create(:event)

      expect(event.formatted_onsale).to_not eq(event.on_sale)
    end
  end
end
