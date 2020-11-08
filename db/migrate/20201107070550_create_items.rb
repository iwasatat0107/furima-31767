class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,           null: false
      t.string :name,               null: false
      t.text :text,                 null: false
      t.integer :images_id,         null: false
      t.integer :category_id,       null: false
      t.integer :condition_id,      null: false
      t.integer :postage_pay_id,    null: false
      t.integer :prefecture_id,     null: false 
      t.integer :shipping_day_id,   null: false
      t.integer :price,             null: false
      t.timestamps
    end
  end
end
