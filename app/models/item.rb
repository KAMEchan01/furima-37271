class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :image,                  presence: true
  validates :item_name,              presence: true
  validates :item_info,              presence: true
  validates :item_category_id,       presence: true
  validates :sale_status_id,         presence: true
  validates :shipping_fee_id,        presence: true
  validates :prefecture_id,          presence: true
  validates :scheduled_delivery_id,  presence: true
  validates :user_id,                presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } , presence: true
  
  
  # アクティブハッシュとのアソシエーション
  belongs_to :item_category
  belongs_to :sale_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :item_category_id,       numericality: { other_than: 1 , message: "can't be blank"}
  validates :sale_status_id,         numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,          numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id,  numericality: { other_than: 1 , message: "can't be blank"}

end
