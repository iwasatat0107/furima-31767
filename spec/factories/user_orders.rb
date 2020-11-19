FactoryBot.define do
  factory :user_order do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { 'ハヤシ' }
    block { '1-9' }
    building { 'モリ' }
    phone_number { 09012345678 }
  end
end
