require 'rails_helper'

RSpec.describe Interest, type: :model do
  describe "relationships" do
    it { should belong_to :user }
  end

  describe "attributes" do
    it { should validate_presence_of :keyword }
  end
end
