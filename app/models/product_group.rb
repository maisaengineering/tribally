class ProductGroup
  include Mongoid::Document
  
  embedded_in :product
  embeds_many :members
  
  field :zipcode, :type => String
end
