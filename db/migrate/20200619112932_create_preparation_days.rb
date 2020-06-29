class CreatePreparationDays < ActiveRecord::Migration[5.0]
  # アクティブハッシュを使うため不要かもしれない
  def change
    create_table :preparation_days do |t|
      t.string     :preparation_day, null: false
      t.references :item,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
