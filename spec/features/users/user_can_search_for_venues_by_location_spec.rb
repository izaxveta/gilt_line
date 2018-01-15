require 'rails_helper'

RSpec.feature 'As an authenticated user' do
  feature 'I can search by location' do
    let(:user) { create(:user) }

    before :each do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'
    end

    scenario 'and get a list of venues in that location' do
      VCR.use_cassette("user-venue-search") do
        within('.search-bar') do
          fill_in 'q', with: '10036'
          click_on 'GO'
        end

        expect(current_path).to eq('/search')
        expect(page).to have_css('.venue-listing')
      end
    end

    scenario 'and each result should have a name, category, price, rating, review_count, phone, location, and image_url' do
      VCR.use_cassette("user-venue-search") do
        within('.search-bar') do
          fill_in 'q', with: '10036'
          click_on 'GO'
        end

        within(first('.venue-listing')) do
          expect(page).to have_css('.listing-name')
          expect(page).to have_css('.listing-categories')
          expect(page).to have_css('.listing-price')
          expect(page).to have_css('.listing-rating')
          expect(page).to have_css('.listing-review_count')
          expect(page).to have_css('.listing-phone')
          expect(page).to have_css('.listing-location')
          expect(page).to have_css('.listing-venue-image')
        end
      end
    end
  end
end