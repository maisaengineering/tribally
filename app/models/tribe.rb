class Tribe
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  validates_associated :products
  
  validates_presence_of :tribe_name, :message => "Please enter tribe name"
  validates_presence_of :location, :message => "Please enter tribe location"  

  belongs_to :member
  has_many :products
  embeds_many :members
    
  field :tribe_name, :type => String
  field :category, :type => String
  field :location, :type => String  
  field :offers, :type => String
  field :amount_saved, :type => Integer
  field :created_by, :type => String
  #field :members, :type => Array
  #field :products, :type => Array
  

  #attr_accessible :tribe_name, :location, :product_name
   
end
