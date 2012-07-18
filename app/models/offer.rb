class Offer
  include Mongoid::Document
  
  embedded_in :product
    
  field :price_discount, :type => String
  field :min_no_of_buyer, :type => Integer
end
