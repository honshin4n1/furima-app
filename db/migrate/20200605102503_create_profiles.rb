class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table  :profiles do |t|
      t.string      :first_name,        null:false
      t.string      :family_name,       null:false
      t.string      :first_name_kana,   null:false
      t.string      :family_name_kana,  null:false
      t.string      :introduction,      null:true
      t.integer     :year,              null:false
      t.integer     :month,             null:false
      t.integer     :day,               null:false
      # ---------プロフィール画面が完成したら必要--------------
      # t.integer     :post_code,         null:true
      # t.string      :prefecture,        null:true   #stringに修正
      # t.string      :city,              null:true
      # t.string      :house_number,      null:true
      # t.string      :building_name,     null:true
      # t.string      :phone_number,      unique:true
      # ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー

      t.references  :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
