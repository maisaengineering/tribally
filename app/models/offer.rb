class Offer
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  embedded_in :product
    
  field :price_discount, :type => String
  field :min_no_of_buyer, :type => Integer
end
