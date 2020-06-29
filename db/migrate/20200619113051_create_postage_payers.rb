class CreatePostagePayers < ActiveRecord::Migration[5.0]
  # アクティブハッシュを使うため不要かもしれない
  def change
    create_table :postage_payers do |t|
      t.string     :postage_payer, null: false
      t.references :item,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
