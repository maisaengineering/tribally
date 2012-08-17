class BusinessesController < ApplicationController
  #skip_before_filter :authenticate_user!
  def index
    @businesses = Business.all
  end

  def show
    @business = Business.find(params[:id])
  end

  def new
    @business = Business.new
  end

  def edit
    @business = Business.find(params[:id])
  end

  def create
    #raise params.inspect
    @user = User.new(:fname => params[:business_name], :email => params[:business_email], :password => params[:password], :password_confirmation => params[:password_confirmation])        
    if @user.save
      @user.businesses.create!(:website => params[:website])
      redirect_to @user, notice: 'Business was successfully created.'
    else
      render action: "business_signup" 
    end
  end
  
  def update
    @business = Business.find(params[:id])    
    if @business.update_attributes(params[:business])
      redirect_to @business, notice: 'Business was successfully updated.'         
    else
      render action: "edit" 
    end
  end

  
  def destroy
    @business = Business.find(params[:id])
    @business.destroy
     redirect_to businesses_url 
  end
  
  def business_signup
    
  end
end
