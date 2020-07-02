class CreateSendingDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :sending_destinations do |t|
      t.string     :first_name,       null: false
      t.string     :family_name,      null: false
      t.string     :first_name_kana,  null: false
      t.string     :family_name_kana, null: false
      t.string     :post_code,        null: false
      t.string     :prefecture,       null: false
      t.string     :city,             null: false
      t.string     :house_number,     null: false
      t.string     :building_name
      t.string     :phone_number,     null: true
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end

    add_index :sending_destinations, :phone_number,  unique: true
  end
end
