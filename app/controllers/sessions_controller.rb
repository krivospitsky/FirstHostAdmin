class SessionsController < ApplicationController
	before_filter :save_login_state, :only => [:login, :login_attempt]
	def login
		#Login Form
	end

	def login_attempt
		authorized_user = User.authenticate(params[:username], params[:password])
		if authorized_user
			session[:user_id] = authorized_user.id
			flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.name}"
			redirect_to(:action => "index", :controller => 'users')
		else
			flash[:notice] = "Invalid Username or Password"
			flash[:color]= "invalid"
			render "login"
		end
	end
	def logout
		session[:user_id] = nil
		redirect_to :action => 'login'
	end
end

