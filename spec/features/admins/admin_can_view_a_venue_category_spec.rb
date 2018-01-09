require 'rails_helper'

RSpec.feature 'As an authenticated Admin user' do
  feature 'I can navigate to "MANAGE VENUE CATEGORIES"' do
    feature 'and see all Venue Categories' do
      scenario 'and can click on a Venue Category to see its show page' do
        admin = create(:user, role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        venue_category = create(:venue_category)

        visit venue_categories_path

        click_on venue_category.name

        expect(current_path).to eq("/admin/venue-categories/#{venue_category.id}")
        expect(page).to have_content(venue_category.name)
      end
    end
  end
end