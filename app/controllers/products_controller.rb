class ProductsController < ApplicationController

  def index
    @products = Product.all
    if params[:query]
      @products = Product.all(:conditions => ["product_name LIKE ?", "%#{params[:query]}%"], :order => 'name', :limit => 5)
    else
      # @products = Product.all
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json do
        if params[:type] == "full"
          render :json => @products.map(&:_as_json)
        else
          render :json => @products.map(&:name)
        end
      end
    end
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
    #@product.destroy
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
    redirect_to products_url
   end
end

