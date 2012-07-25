class TribesController < ApplicationController
  
  def index
    @tribes = Tribe.all
  end
  
  def show
    @tribe = Tribe.find(params[:id])
    @invitee_uid = []
    if !@tribe.members.blank?
      @tribe.members.each do |each_member|
        @invitee_uid.push(each_member.uid)
      end
    end    
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
      @tribe.members.push(Member.new(:uid => current_user.uid))
      if !params[:invitees].blank? 
        invitee_list = params[:invitees].split(",")      
        invitee_list.each do |each_invitee_uid|        
          @tribe.members.push(Member.new(:uid => each_invitee_uid))
        end
      end
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
    redirect_to tribes_path
  end
  
  def change_invitation_status
    @tribe = Tribe.where(:_id => params[:id]).first
    @tribe.members.each do |each_member|      
        if each_member.uid == params[:uid]
          each_member.update_attributes(:status => 'accepted')
        end
    end
    redirect_to tribes_path
  end
  
  def my_tribe    
    @tribes = Tribe.where('members.uid' => current_user.uid)
  end
    
end
