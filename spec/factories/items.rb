FactoryBot.define do
  factory :item do
    name              { 'テスト' }
    text              { 'テストテストテストテストテストテスト' }
    category_id       { 2 }
    condition_id      { 2 }
    postage_pay_id    { 2 }
    prefecture_id     { 2 }
    shipping_day_id   { 2 }
    price             { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
