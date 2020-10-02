class ProductsController < ApplicationController
 
  # get all products
  def index
    @products = Product.all
  end

  # new product form
  def new
    @product = Product.new
  end
 
  # create a product
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def product_params
    params.require(:product).permit(:name, :upc, :available_on, :property_name, :property_value)
  end
 
end