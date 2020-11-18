class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :block, :building, :phone_number, :purchase

  with_options presence: true do
    validates :post_code
    validates :city
    validates :block
    validates :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  
  def save
    
    
    purchase = Purchase.create(item_id: item_id, user_id: user_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
    
  end

end
