class Product
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  embeds_many :offers
  #embedded_in :tribe
  #embeds_many :comments
  
  field :business_name, :type => String
  field :members, :type => String
  field :product_name, :type => String
  field :description, :type => String
  field :product_url, :type => String
  field :price, :type => String
end
