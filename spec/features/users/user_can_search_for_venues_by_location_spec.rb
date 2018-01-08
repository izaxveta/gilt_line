require 'rails_helper'

RSpec.feature 'As an authenticated user' do
  feature 'I can search by location' do
    let(:user) { create(:user) }

    before :each do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit '/dashboard'
    end

    scenario 'and get a list of venues in that location' do
      within('.search-bar') do
        fill_in 'q', with: '10036'
        click_on 'GO'
      end

      expect(current_path).to eq('/search')
      expect(page).to have_css('.venue')
    end

    scenario 'and each result should have a name, category, price, rating, review_count, phone, location, and image_url' do
      within('.search-bar') do
        fill_in 'q', with: '10036'
        click_on 'GO'
      end

      within(first('.venue')) do
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