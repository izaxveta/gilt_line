require 'rails_helper'

RSpec.feature 'As an authenticated Admin user' do
  feature 'I can navigate to Settings' do
    feature 'click on "Manage Venue Categories"' do
      feature 'click on "Venue Category Generator"' do
        let(:admin) { create(:user, role: 1) }

        before :each do
          admin
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        end

        scenario 'and I can enter in Yelp sourced json to generate venue categories' do
          json = '[{"alias": "bistros", "title": "Bistros",
              "parents": ["restaurants"], "country_blacklist": ["US"]},
              {"alias": "creperies","title": "Creperies",
              "parents": ["restaurants"]},
              {"alias": "hkcafe","title": "Hong Kong Style Cafe",
              "parents": ["restaurants"], "country_whitelist": ["TW","US","HK"]}]'

          visit '/admin/settings'

          click_on 'MANAGE VENUE CATEGORIES'

          expect(current_path).to eq('/admin/venue-categories')
          expect(page).to have_content("There are currently no Venue Categories. Use the Venue Category Generator to update the system.")

          click_on 'VENUE CATEGORY GENERATOR'

          expect(current_path).to eq('/admin/venue-categories/generator')

          fill_in 'generator_form', with: json
          click_on 'GENERATE'

          expect(current_path).to eq('/admin/venue-categories')
          expect(page).to have_css('.venue-category', count: 2)
          within(first('.venue-category')) do
            expect(page).to have_content('Creperies')
          end
        end
      end
    end
  end
end