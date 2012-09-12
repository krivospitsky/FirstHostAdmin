class User < ActiveRecord::Base
  attr_accessible :email, :name
  before_create :do_create
  before_destroy :do_destroy
  def do_create
    system("adduser #{self.name} && adduser #{self.name} www-data")
  end
  def do_destroy
    system("deluser #{self.name}")
  end
end
