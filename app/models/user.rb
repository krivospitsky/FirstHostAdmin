class User < ActiveRecord::Base
	attr_accessible :email, :name, :gid, :uid
	has_many :domains
	before_create :do_create
	before_destroy :do_destroy

	def do_create
		system("sudo adduser #{self.name} && adduser #{self.name} www-data")
	end

	def do_destroy
		system("sudo deluser ", self.name)
	end

	def self.authenticate(username="", password="")
		user = User.find_by (:name, username)

		if user && authpam(username, password)
			return user
		else
			return false
		end
	end
end
