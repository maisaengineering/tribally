class ProductsController < ApplicationController

  def index
    @products = Product.all

  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.offers.build 
  end

  def edit
    @product = Product.find(params[:id])
    as = @product.offers
  end

  def create
    @product = Product.new(params[:product])

      if @product.save
        redirect_to @product, notice: 'Product was successfully created.' 
      else
        render action: "new" 
      end
  end

  def update
    @product = Product.find(params[:id])
    @product.offers.destroy
      if @product.update_attributes(params[:product])
        redirect_to @product, notice: 'Product was successfully updated.' 
      else
        render action: "edit" 
      end 
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url 
    end
end

def show
@comment = Comment.new
@comment.product_id = @product.id
end

def create
    product_id = params[:comment].delete(:product_id)

    @comment = Comment.new(params[:comment])
    @comment.product_id = product_id

    @comment.save

    redirect_to product_path(@comment.product)
  end
