require 'rails_helper'

describe UpcomingOnSalesJob, :vcr, type: :job do
  before :each do
    ActiveJob::Base.queue_adapter = :test
    @job = UpcomingOnSalesJob.new
  end

  describe '#find_events' do
    it 'finds events based on user interests' do
      result = @job.find_events(['phish'])
      expect(result).to be_an Array
      expect(result[0].name).to eq('Phish')
    end
  end

  describe '#perform' do
    it 'Sends out an SMS notification if events are going on sale' do
      event = create(:event, on_sale: Time.now)
      mock = [event]
      allow_any_instance_of(UpcomingOnSalesJob).to receive(:find_events).and_return(mock)
      expect { @job.perform('phish') }.to enqueue_job
    end
  end
end
