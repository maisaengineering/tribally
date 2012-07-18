class Product
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  embeds_many :offers
  embedded_in :tribe
  
  field :business_name, :type => String
  field :members, :type => Array
  field :product_name, :type => String
  field :description, :type => String
  field :url
  field :price, :type => String
end
