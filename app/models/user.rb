class User < ActiveRecord::Base
	attr_accessible :email, :name, :gid, :uid
	has_many :domains

	EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
	validates :name, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
	validates :email, :presence => true, :format => EMAIL_REGEX

	before_create :do_create
	def do_create
		system("sudo adduser #{self.name} && adduser #{self.name} www-data")
	end

	before_destroy :do_destroy
	def do_destroy
		system("sudo deluser ", self.name)
	end

	def self.authenticate(username="", password="")
		user = User.find_by_name(username)

#		if user && authpam(username, password)
			return user
#		else
#			return false
#		end
	end
end
