class AddAttributesColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birthday, :date
    add_column :users, :nationality, :string
    add_column :users, :occupation, :string
  end
end
