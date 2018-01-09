FactoryBot.define do
  factory :venue_category do
    sequence :name do
      Faker::Dessert.variety
    end
  end
end