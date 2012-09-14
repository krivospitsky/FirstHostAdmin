class Mailbox < ActiveRecord::Base
  attr_accessible :domain_id, :password, :user_name
  belongs_to :domain
  validates :domain_id, :presence => true
  validates :user_name, :presence => true
  validates :password, :presence => true
end
