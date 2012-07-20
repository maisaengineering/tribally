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
    #raise params.inspect
    @tribe = Tribe.new(params[:tribe])
    # TODO CREATE MEMBER
    if @tribe.save
      redirect_to @tribe, notice: 'Tribe was successfully created.'
    else
      @tribe.products.build
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
    redirect_to tribes_path
  end
end
