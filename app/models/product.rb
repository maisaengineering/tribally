class Product
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  embeds_many :offers
  belongs_to :tribe
  embeds_many :comments  
  embeds_many :product_groups
  
  #validates_presence_of :product_name, :message => "Please enter tribe first product"
  
  field :business_name, :type => String
  field :members, :type => String
  field :product_name, :type => String
  field :description, :type => String
  field :product_url, :type => String
  field :price, :type => String
  field :offers, :type => Array
end
