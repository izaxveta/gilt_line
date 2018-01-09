require 'rails_helper'

RSpec.feature 'As a registered user' do
  let(:user) { create(:user) }

  scenario 'I can click on a link to complete my profile' do
    create(:label, name: 'Balenciaga')
    create(:label, name: 'VALENTINO')
    create(:label, name: 'Dolce and Gabbana')

    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(user)

    visit '/dashboard'

    click_on 'COMPLETE PROFILE'

    expect(current_path).to eq(edit_profile_path(user))

    select '1985',    from: 'user[birthday(1i)]'
    select 'January', from: 'user[birthday(2i)]'
    select '1',       from: 'user[birthday(3i)]'
    fill_in 'user[nationality]', with: 'French'
    fill_in 'user[occupation]',  with: 'Writer'
    check('Dolce and Gabbana')
    check('VALENTINO')

    click_on 'SUBMIT'

    expect(current_path).to eq(profile_path)
    expect(page).to have_content('Dolce and Gabbana')
    expect(page).to have_content('VALENTINO')
    expect(page).not_to have_content('Balenciaga')
    expect(page).to have_content('Writer')
    expect(page).to have_content('French')
    expect(page).to have_content("#{user.first_name} #{user.last_name}")
    expect(page).to have_content('January 1, 1985')
  end
end