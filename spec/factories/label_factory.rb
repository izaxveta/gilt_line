FactoryBot.define do
  factory :label do
    sequence :name do
      Faker::Zelda.character
    end
  end
end