class Tribe
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  #validates_presence_of :tribe_name
  #validates_presence_of :location
  #validates_presence_of :product_name

  belongs_to :member
  embeds_many :products
  embeds_many :members
  
  field :product_name, :type => String
  field :tribe_name, :type => String
  field :category, :type => String
  field :location, :type => String  
  field :offers, :type => String
  field :amount_saved, :type => Integer
  #field :members, :type => Array
  #field :products, :type => Array
  
  #attr_accessible :tribe_name, :location, :product_name
   
end
