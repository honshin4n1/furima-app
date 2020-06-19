class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :name, null: true
      t.references :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
