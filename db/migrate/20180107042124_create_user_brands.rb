class CreateUserBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :user_brands do |t|
      t.references :user, foreign_key: true
      t.references :brand, foreign_key: true
    end
  end
end
