class CreateUserLabels < ActiveRecord::Migration[5.1]
  def change
    create_table :user_labels do |t|
      t.references :user, foreign_key: true
      t.references :label, foreign_key: true
    end
  end
end
