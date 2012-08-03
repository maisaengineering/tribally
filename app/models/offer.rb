class Offer
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  embedded_in :product
    
  field :price_discount, :type => String
  field :min_no_of_buyer, :type => Integer
  field :offer_name, :type => String
  field :offer_price, :type => String
  field :offer_description, :type => String
  field :retails_price, :type => String
end
