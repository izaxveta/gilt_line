class CreateFashionBrands < ActiveRecord::Migration[5.1]
  def change
    create_table :fashion_brands do |t|
      t.string :name
    end
  end
end
