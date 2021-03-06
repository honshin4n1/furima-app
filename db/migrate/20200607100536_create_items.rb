class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string      :name,                      null: false
      t.text        :introduction,              null: false
      t.integer     :price,                     null: false
      t.string      :size,                      null: false
      t.boolean     :deal_state,                null: false, default: 0   # 0 => が売り出し中、１=> 売り切れ
      t.integer     :buyer
      t.references  :user,                      null: false, foreign_key: true
      t.references  :brand,                     foreign_key: true
      t.references  :category,                  null: false, foreign_key: true
      t.integer     :prefecture_id,             null: false     #発送元地域
      t.integer     :preparation_day_id,        null: false     #発送までの日数
      t.integer     :postage_payer_id,          null: false     #配送料負担者
      t.integer     :condition_id,              null: false     #商品の状態
      t.timestamps
    end
  end
end
