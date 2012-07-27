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
    @tribe = Tribe.where(:_id => params[:tribe]).first    
    @tribe.products.create(:product_name => params[:product_name], :members => [Member.new(:uid => current_user.uid)])
    redirect_to tribe_products_tribes_path(:id => @tribe._id)
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

  def add_comment
	product = Product.where(:_id => params[:product_id]).first	
	product.comments.push([Comment.new(:user_id => params[:user_id], :body => params[:body])])
	
   end
end

