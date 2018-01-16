require 'rails_helper'

RSpec.feature 'As an authenticated user' do
  feature 'I can search for venues by location' do
    feature 'click on a venue, navigating to the venue show page' do
      scenario 'and see fashion suggestions for that venue' do
        VCR.use_cassette("venue_fashion_suggestions") do
          user            = create(:user)
          versace         = create(:label, name: 'Versace')
          rebecca_minkoff = create(:label, name: 'Rebecca Minkoff')
          bcbgmaxazria    = create(:label, name: 'BCBGMAXAZRIA')

          wine_bar  = create(:venue_category, name: 'Wine Bars')
          seafood    = create(:venue_category, name: 'Seafood')
          steakhouse = create(:venue_category, name: 'Steakhouses')

          wine_bar.labels << rebecca_minkoff
          wine_bar.labels << bcbgmaxazria

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

          visit '/dashboard'
          fill_in 'q', with: '32839'
          click_on 'GO'

          first('.venue-container > a').click

          expect(current_path).to eq(venue_path)
          expect(page).to have_link('APPAREL')
          expect(page).to have_link('SHOES')
          expect(page).to have_link('ACCESSORIES')
          expect(page).to have_css('.item-container')
          within(first('.item-container')) do
            expect(page).to have_css('.image')
            within('.image') do
              expect(page).to have_css('.item-image')
              expect(page).to have_css('.heart')
            end
            expect(page).to have_css('.item-info')
            within('.item-info') do
              expect(page).to have_css('.price')
              expect(page).to have_css('.style')
              within('.style') do
                expect(page).to have_css('.label-name')
                expect(page).to have_css('.name')
              end
            end
          end
        end
      end
    end
  end
end