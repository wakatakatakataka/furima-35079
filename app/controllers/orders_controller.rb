class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_root_path, only: [:index, :create]
  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
       pay_item
       @order_delivery.save
       redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_delivery).permit(:zip_code, :shipping_area_id, :city, :address, :building_name, :telephone).merge(token: params[:token], user_id: current_user.id, product_id: params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_root_path
    if user_signed_in? && current_user.id == @product.user_id || @product.order.present?
      redirect_to root_path
    end
  end
end
