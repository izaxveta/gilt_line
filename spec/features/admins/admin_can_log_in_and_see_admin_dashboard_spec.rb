require 'rails_helper'

RSpec.feature 'As a registered Admin user' do
  feature 'I can sign in to my account' do
    scenario 'and see that I am on an Admin Dashboard' do
      user = create(:user, role: 1)

      visit '/'
      click_on "SIGN IN"
      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password
      click_on "SIGN IN"

      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Welcome,")
      expect(page).to have_content(user.full_name)
      expect(page).to have_content("Administrator")
    end
  end
end