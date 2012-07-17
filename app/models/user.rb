class User
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  extend Rolify
  rolify
  
  has_one :member
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  validates_presence_of :email
  validates_presence_of :encrypted_password
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  field :confirmation_token,   :type => String
  field :confirmed_at,         :type => Time
  field :confirmation_sent_at, :type => Time
  field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  ## Token authenticatable
  # field :authentication_token, :type => String
  # run 'rake db:mongoid:create_indexes' to create indexes
  index :email, :unique => true
  field :name
  field :fname
  field :lname
  field :provider 
  field :uid
  field :token

  #validates_presence_of :name
  attr_accessible :fname, :lname, :email, :password, :password_confirmation, :remember_me, :confirmed_at, :provider, :uid
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info    
    provider = access_token.provider
    
    if provider == 'facebook'            
      email =  data.email
      name =  data.name
      first_name =  data.first_name
      last_name =  data.last_name          
      image_path =  access_token.info.image          
      uid =  data.id
    else                                       
      render :text => '--- provider, #{@provider_route}, not supported ---'  
      return
    end
    
    if uid != '' and provider != ''
      auth = User.where(:provider => provider).and(:uid => uid).first        
      raise auth.inspect
      if !auth.nil?
        flash[:notice] = "Signed in successfully"
        sign_in_and_redirect(:user, auth.user)
      else  
        user = User.find_or_initialize_by_email(:email => email)
        auth_hash = {:provider => provider, :uid => uid, :name => name, :email => email, :fname => first_name, :lname => last_name, :token => access_token.credentials.token}
        user.apply_omniauth(auth_hash)        
        if user.save!
          flash[:notice] = "New user signed in successfully." 
          sign_in_and_redirect(:user, user)          
        else
          redirect_to new_user_registration_path
        end
      end
    end
    
    
    
    
    
    
    
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password. 
      User.create!(:email => data.email, :password => Devise.friendly_token[0,20]) 
    end
  end

  def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"]

        end
      end
  end
end
