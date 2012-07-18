class Tribe
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  validates_presence_of :tribe_name, :location
  
  belongs_to :member
  embeds_many :products
  
  field :tribe_name, :type => String
  field :category, :type => String
  field :location, :type => String
  field :tribe_members, :type => String
  field :offers, :type => String
  field :amount_saved, :type => Integer
end
