require 'rails_helper'

RSpec.feature 'As an authenticated user' do
  feature 'I can search for venues by location' do
    scenario "and click on a venue to see it's show page" do
      VCR.use_cassette("user_venue_search_show") do
        user = create(:user)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        within('.search-bar') do
          fill_in 'q', with: '10036'
          click_on 'GO'
        end

        first('.venue > a').click

        expect(current_path).to eq(venue_path)
        expect(page).to have_css('.name')
        expect(page).to have_css('.categories')
        expect(page).to have_css('.price')
        expect(page).to have_css('.rating')
        expect(page).to have_css('.review_count')
        expect(page).to have_css('.phone')
        expect(page).to have_css('.location')
        expect(page).to have_css('.venue-image')
      end
    end
  end
end