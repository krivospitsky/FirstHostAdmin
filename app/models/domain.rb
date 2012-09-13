class Domain < ActiveRecord::Base
  attr_accessible :alias, :fqdn, :user_id
  belongs_to :user
  has_many :mailbox
end
