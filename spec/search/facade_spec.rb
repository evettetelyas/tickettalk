require 'rails_helper'

describe 'Search Facade' do
  before :each do
    @facade_1 = SearchFacade.new('pickles', 'date_asc')
    @facade_2 = SearchFacade.new('pickles', 'price_asc')
    @facade_3 = SearchFacade.new('pickles', 'onsale_asc')
    @facade_4 = SearchFacade.new('pickles', 'fake')
  end

  describe '#sort' do
    it 'returns a 0 or 1 depending on type' do
      expect(@facade_1.sort(true)).to eq([0, true])
      expect(@facade_1.sort(false)).to eq([1, nil])
    end
  end
end
