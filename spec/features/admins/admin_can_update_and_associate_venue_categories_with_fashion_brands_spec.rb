require 'rails_helper'

RSpec.feature 'As an authenticated Administrator' do
  feature 'I can visit a Venue Category show page' do
    feature 'click on "Edit" to update/add information to this Venue Category' do
      scenario 'and associate this Venue Category with existing Fashion Brands' do
        admin = create(:user, role: 1)
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
        venue_category = create(:venue_category)
        label_1 = create(:label)
        label_2 = create(:label)
        label_3 = create(:label)
        label_4 = create(:label)

        visit venue_category_path(id: venue_category.id)

        click_on 'EDIT'

        expect(current_path).to eq("/admin/venue-categories/#{venue_category.id}/edit")

        check(label_1.name)
        check(label_3.name)

        click_on 'UPDATE'

        expect(current_path).to eq("/admin/venue-categories/#{venue_category.id}")
        expect(page).to have_content(label_1.name)
        expect(page).to have_content(label_3.name)
        expect(page).to have_content("#{venue_category.name} update successful")
        # check('.venue-category[value="#{}"]')
        # find(:css, "#cityID[value='62']").set(true)
      end
    end
  end
end