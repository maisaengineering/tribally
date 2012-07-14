class Product
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  embedded_in :tribe
  
  field :members, :type => Array
  field :product_name, :type => String
  field :description, :type => String
  field :price, :type => String
end
