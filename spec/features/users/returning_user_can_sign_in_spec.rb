require 'rails_helper'

RSpec.feature 'As a returning unauthenticated user' do
  scenario 'I can navigate to the sign in page and sign in' do
    user = User.create(first_name: 'Lourdes',
                       last_name: 'Laurentum',
                       email: 'lourdes@mail.com',
                       password: 'password')

    visit '/'
    click_on 'SIGN IN'

    expect(current_path).to eq('/login')

    fill_in 'session[email]', with: 'lourdes@mail.com'
    fill_in 'session[password]', with: 'password'

    click_on 'SIGN IN'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Lourdes Laurentum')
  end
end