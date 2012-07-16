class TribesController < ApplicationController
  
  def index
    @tribes = Tribe.all
  end
  
  def show
    @tribe = Tribe.find(params[:id])
  end
  
  def new
    @tribe = Tribe.new
    @tribe.products.build
  end

  def edit
    @tribe = Tribe.find(params[:id])
  end

  def create
    @tribe = Tribe.new(params[:tribe])
    
    if @tribe.save
      redirect_to @tribe, notice: 'Tribe was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @tribe = Tribe.find(params[:id])

    
    if @tribe.update_attributes(params[:tribe])
      redirect_to @tribe, notice: 'Tribe was successfully updated.'
    else
      render action: "edit"
    end
    
  end

  def destroy
    @tribe = Tribe.find(params[:id])
    @tribe.destroy
  end
end