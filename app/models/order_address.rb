class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address1, :address2, :phone

  with_options presence: true do
    validates :user_id
    validates :item_id
    
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"} 
    validates :city
    validates :address1
    validates :phone, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
  end
   
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
   
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      
      # 住所を保存する
      Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address1: address1, address2: address2, order_id: order.id)
    end
end