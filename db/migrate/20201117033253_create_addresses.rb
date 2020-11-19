class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_code,       null: false
      t.integer :prefecture_id,  null: false
      t.integer :city,           null: false
      t.integer :block,          null: false
      t.integer :building 
      t.string :phone_number,   null: false
      t.references :purchase,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
