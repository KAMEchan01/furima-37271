class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @order_address = OrderAddress.new
  end

  def new
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
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address1, :address2, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def address_params
    params.permit(:postal_code, :prefecture, :city, :address1, :address2, :phone ).merge(doder_id: @order.id)
  end



end
