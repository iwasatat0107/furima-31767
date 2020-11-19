class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_pay
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
  belongs_to :user
  has_one    :purchase

  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_pay_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
