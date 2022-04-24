class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  belongs_to :item_category
  belongs_to :sale_status
  belongs_to :shipping_fee
  belongs_to :prefectuer
  belongs_to :scheduled_delivery

end
