# create_table :items do |t|
#   t.string      :name,              null: false
#   t.text        :introduction,      null: false
#   t.integer     :price,             null: false
#   t.integer     :size,              null: false
#   t.integer     :condition,         null: false
#   t.boolean     :deal_state,        null: false
#   t.integer     :buyer
#   t.references  :user,             null: false, foreign_key: true
#   t.references  :brand,            null: false, foreign_key: true
#   t.references  :category,         null: false, foreign_key: true
#   t.timestamps

names = %w()
introductions = %w()
prices = %w()
sizes =
conditons =
