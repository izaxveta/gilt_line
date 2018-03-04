class AddMonikerColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :moniker, :string
  end
end
