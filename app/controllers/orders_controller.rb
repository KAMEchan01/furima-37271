class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,:create]

  before_action :set_item, only: [:index, :create]


  def index
    @order_address = OrderAddress.new
  end



  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address1, :address2, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params
    params.permit(:postal_code, :prefecture, :city, :address1, :address2, :phone ).merge(doder_id: @order.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end


end
