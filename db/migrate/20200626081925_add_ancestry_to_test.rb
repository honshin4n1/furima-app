class AddAncestryToTest < ActiveRecord::Migration[5.0]
  def change
    add_column :tests, :ancestry, :string
    add_index :tests, :ancestry
  end
end
