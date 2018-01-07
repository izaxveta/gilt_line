require 'rails_helper'

RSpec.feature 'As a visitor' do
  scenario 'I can visit the root path' do
    visit '/'

    expect(current_path).to eq(root_path)

    fill_in 'user[first_name]', with: "Lourdes"
    fill_in 'user[last_name]', with: "Laurentum"
    fill_in 'user[email]', with: "lourdes@mail.com"
    fill_in 'user[password]', with: "password"

    click_on "REGISTER"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Welcome,")
    expect(page).to have_content("Lourdes Laurentum")
    expect(page).to have_content("lourdes@mail.com")
  end
end