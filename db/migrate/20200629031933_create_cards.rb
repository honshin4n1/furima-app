class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      # t.integer :card_number, limit: 8, null: false, unique: true
      # t.integer :expiration_year, null: false
      # t.integer :expiration_month, null: false
      # t.integer :secret_code, null: false
      # t.references :user, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true
      t.string :customer_id, null: false
      t.string :card_id, null: false
      t.timestamps
    end
  end
end
