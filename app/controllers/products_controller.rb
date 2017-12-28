class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: t(:create_success)
    else
      flash[:alert] = t(:create_error)
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: t(:update_success)
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_path, notice: t(:destroy_success)
    else
      flash[:alert] = t(:destroy_error)
      render :show
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
