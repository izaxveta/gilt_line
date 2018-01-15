require 'rails_helper'

RSpec.feature 'As an authenticated user' do
  scenario 'I can sign out using the link in the drop down menu' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content (user.first_name)

    click_on "S I G N O U T"

    expect(current_path).to eq(root_path)
  end
end