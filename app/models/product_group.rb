class ProductGroup
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  embedded_in :product
  embeds_many :members
  
  field :zipcode, :type => String
   attr_accessible :zipcode
end
