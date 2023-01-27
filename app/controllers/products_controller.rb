class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_product, only: [:show, :edit, :update, :destroy, :deactive]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end
  
  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path, notice: 'Product was successfully destroyed.'
  end

  def deactive
    @product.deactive!
    redirect_to products_path, notice: 'Product was deactived'
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :subclass, :active )
    end

    def require_admin
      unless current_user.admin?
        flash[:alert] = "You are not allowed visit this page"
        redirect_to root_path
      end
    end
end
