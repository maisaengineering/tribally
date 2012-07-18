class Tribe
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  validates_presence_of :tribe_name, :location
  
  belongs_to :member
  embeds_many :products
  embeds_many :members
  
  field :tribe_name, :type => String
  field :category, :type => String
  field :location, :type => String  
  field :offers, :type => String
  field :amount_saved, :type => Integer
  #field :members, :type => Array
  #field :products, :type => Array
  
end
