class Mailbox < ActiveRecord::Base
  attr_accessible :domain_id, :password, :user_name
  belongs_to :domain
end
