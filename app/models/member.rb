class Member
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
  
  belongs_to :user
  has_many :tribes
    
  field :transaction_history, :type => Array
  field :delivery_address, :type => Array
end
