FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { Faker::Internet.free_email }
    password              { '00000a' }
    #  名前/カナ/生年月日
    last_name            { '阿部' }
    first_name           { '太郎' }
    last_name_kana       { 'アベ' }
    first_name_kana      { 'タロウ' }
    birthday             { '1930-01-01' }
  end
end
