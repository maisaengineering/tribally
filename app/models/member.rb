class Member
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  belongs_to :user
  has_many :tribes
  embedded_in :tribe
    
  field :transaction_history, :type => String
  field :delivery_address, :type => String
end
