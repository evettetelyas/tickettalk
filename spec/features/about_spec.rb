require 'rails_helper'

describe 'About Us page' do
  describe "any user can click 'About Us' from the main page" do
    it 'can read who we are, about the project, the schema and tech stack' do
      visit root_path

      click_link 'About Us'

      expect(current_path).to eq(about_path)
    end
  end
end
