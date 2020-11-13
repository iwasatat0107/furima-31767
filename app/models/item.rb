class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage_pay
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image
  belongs_to :user

  validates :name, presence: true
  validates :text, presence: true
  validates :image, presence: true

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :postage_pay_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }

  # with_options format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  # end
end
