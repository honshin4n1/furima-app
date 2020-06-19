class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.integer :evaluation, default: 0, null: false    #enumメソッドをモデルクラス内に記述のこと
      t.stirng :review
      t.references :item, null: false ,foreign_key: true
      t.references :user, null: false ,foreign_key: true
      t.timestamps
    end
  end
end
