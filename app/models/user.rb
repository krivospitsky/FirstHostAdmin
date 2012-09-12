class User < ActiveRecord::Base
  attr_accessible :email, :name
  before_create :do_create
  def do_create
    system("adduser #{:name}")
  end
end
