class User < ActiveRecord::Base
  attr_accessible :email, :name
  before_create :do_create
  before_destroy :do_destroy
  def do_create
    system("touch ~/1.txt")
#    system("sudo", "adduser #{self.name}")
  end
  def do_destroy
    system("sudo deluser ", self.name)
  end
end
