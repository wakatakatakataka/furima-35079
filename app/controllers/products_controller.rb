class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :condition_id, :shipping_change_id, :shipping_area_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
