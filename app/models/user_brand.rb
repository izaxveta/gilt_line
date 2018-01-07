class UserBrand < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :brand_id
  belongs_to :user
  belongs_to :brand

  def self.set_favorite_brands(brand_ids, user)
    user.brands.delete_all
    brand_ids.each { |id| user.brands << Brand.find(id) if id != '' }
  end

end