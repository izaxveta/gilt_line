class DropTableUserBrands < ActiveRecord::Migration[5.1]
  def change
    drop_table :user_brands
  end
end
