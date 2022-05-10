FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address1 { '1-1' }
    address2 { '東京ハイツ' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
