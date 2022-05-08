class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,:create]

  before_action :set_item, only: [:index, :create]


  def index
    @order_address = OrderAddress.new
  end



  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address1, :address2, :phone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  #def address_params
   # params.permit(:postal_code, :prefecture, :city, :address1, :address2, :phone ).merge(doder_id: @order.id)
  #end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
  Payjp.api_key = "sk_test_1d19aca25d21173b4efa3f0f"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
  end


end
