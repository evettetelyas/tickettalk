require 'rails_helper'

describe SmsNotificationJob, :vcr, type: :job do
  before :each do
    ActiveJob::Base.queue_adapter = :test
    @job = SmsNotificationJob.new
  end

  describe '#perform' do
    # This tests works but is skipped because of an error it causes in travis ci
    xit 'Sends out an SMS notification if events are going on sale' do
      event = create(:event)
      result = @job.perform(event)
      expect(result.class).to eq Twilio::REST::Api::V2010::AccountContext::MessageInstance
      expect(result.body).to include('Sent from your Twilio trial account')
    end
  end
end
