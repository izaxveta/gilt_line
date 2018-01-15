require 'rails_helper'

RSpec.feature 'As an authenticated Admin user' do
  feature 'I can visit my admin dashboard' do
    feature 'click on "Settings"' do
      scenario 'and create a new store' do
        admin = create(:user, role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_dashboard_path
save_and_open_page
        click_on "S E T T I N G S" #dashboard show
        expect(current_path).to eq('/admin/settings')
        click_on "MANAGE LABELS" # brands index
        expect(current_path).to eq('/admin/labels')
        click_on "+ FASHION LABEL"
        expect(current_path).to eq('/admin/labels/new')

        fill_in 'label[name]', with: 'Kate Spade New York'
        click_on "CREATE"

        expect(current_path).to eq('/admin/labels')
        expect(page).to have_css('.label', count: 1)
        within(first('.label')) do
          expect(page).to have_content("Kate Spade New York")
        end
      end
    end
  end
end