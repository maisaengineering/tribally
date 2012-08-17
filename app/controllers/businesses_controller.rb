class BusinessesController < ApplicationController
  skip_before_filter :authenticate_user!  
  def index
    @businesses = Business.all
     #@user = User.find("_id" => @business.user_id)
  end

  def show
    
    @business = Business.find(params[:id])
    #raise @business.user_id.inspect
    @user = User.where("_id" => @business.user_id)
    #@user.each do |each_details|
     # raise each_details.fname.inspect
    #end
    
  end

  def new 
    @business = Business.new    
  end

  def edit
    @business = Business.find(params[:id])
  end

  def create
    #raise params.inspect
    @user = User.new(:fname => params[:business_name], :email => params[:business_email], :password => params[:password], :password_confirmation => params[:password_confirmation], :role => 'business')        
    if @user.save
      @user.businesses.create!(:website => params[:website])
      redirect_to @user, notice: 'Business was successfully created.'
    else
      render action: "business_signup" 
    end
  end
  
  def update
    raise params.inspect
    @business = Business.find(@business.user_id => @user._id)
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
