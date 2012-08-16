class BusinessesController < ApplicationController

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
    @business = Business.new(params[:business])

    
      if @business.save
         redirect_to @business, notice: 'Business was successfully created.'
             else
        render action: "new" 
        
      
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
end
