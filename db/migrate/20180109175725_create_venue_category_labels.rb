class CreateVenueCategoryLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :venue_category_labels do |t|
      t.references :label, foreign_key: true
      t.references :venue_category, foreign_key: true
    end
  end
end
