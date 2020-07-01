class AddAncestryToCategories < ActiveRecord::Migration[5.0]
  def up
    add_column :categories, :ancestry, :string
    add_index :categories, :ancestry
  end

  def down
    add_index :categories, :ancestry
    add_column :categories, :ancestry, :string
  end
end
