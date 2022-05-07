FactoryBot.define do
  factory :order_address do
    user_id {1}
    item_id {1}
    postal_code { '123-4567' }
    prefecture_id {2}
    city { '東京都' }
    address1 { '1-1' }
    address2 { '東京ハイツ' }
    phone { '09012345678' }
    
  end
end
