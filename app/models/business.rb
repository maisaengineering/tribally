class Business
  include Mongoid::Document
  
  belongs_to :users
  
  field :business_name, :type => String
  field :website, :type => String
  field :business_email, :type => String
  field :offers_history, :type => String
  field :invoices, :type =>String
  field :account_data, :type =>String

  #validates_presence_of :business_name
  validates_presence_of :website
  #validates_presence_of :offers_history
  #validates_presence_of :invoices
  #validates_presence_of :account_data
  
  attr_accessible :business_name, :website, :business_email, :offers_history, :invoices, :account_data

end
