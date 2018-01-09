require 'rails_helper'

RSpec.feature 'As an authenticated Admin user' do
  feature 'I can visit my admin dashboard' do
    feature 'click on "Settings"' do
      let(:admin) { create(:user, role: 1) }

      feature 'click on "Manage Brands"' do
        before :each do
          admin
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        end

        scenario 'and create a new store' do
          visit admin_dashboard_path

          click_on "SETTINGS" #dashboard show
          expect(current_path).to eq('/admin/settings')
          click_on "MANAGE BRANDS" # brands index
          expect(current_path).to eq('/admin/fashion-brands')
          click_on "+ FASHION BRAND"
          expect(current_path).to eq('/admin/fashion-brands/new')

          fill_in 'fashion_brand[name]', with: 'Kate Spade New York'
          click_on "CREATE"

          expect(current_path).to eq('/admin/fashion-brands')
          expect(page).to have_css('.fashion-brand', count: 1)
          within(first('.fashion-brand')) do
            expect(page).to have_content("Kate Spade New York")
          end
        end
      end
    end
  end
end