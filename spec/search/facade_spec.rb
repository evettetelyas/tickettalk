require 'rails_helper'

describe 'Search Facade', :vcr do
  before :each do
    @facade_1 = SearchFacade.new('phish', 'date_asc')
    @facade_2 = SearchFacade.new('phish', 'price_asc')
    @facade_3 = SearchFacade.new('phish', 'onsale_asc')
    @facade_4 = SearchFacade.new('phish', 'fake')
  end

  describe '#sort' do
    it 'returns a 0 or 1 depending on type' do
      expect(@facade_1.sort(true)).to eq([0, true])
      expect(@facade_1.sort(false)).to eq([1, nil])
    end
  end

  describe '#events' do
    it 'returns a sorted list of events depending on sort type' do
      expect(@facade_1.events).to be_an Array
      expect(@facade_2.events).to be_an Array
      expect(@facade_3.events).to be_an Array
      expect(@facade_4.events).to be_an Array
    end
  end
end
