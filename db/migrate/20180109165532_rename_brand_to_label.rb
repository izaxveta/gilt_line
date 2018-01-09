class RenameBrandToLabel < ActiveRecord::Migration[5.1]
  def change
    rename_table :brands, :labels
  end
end
