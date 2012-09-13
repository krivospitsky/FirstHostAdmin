class ApplicationController < ActionController::Base
	before_filter :authenticate_user
	skip_before_filter :authenticate_user, :only => [:login, :login_attempt]
	protect_from_forgery
	protected
		def authenticate_user
			unless session[:user_id]
				redirect_to(:controller => 'sessions', :action => 'login')
				return false
			else
				# set current user object to @current_user object variable
				@current_user = User.find session[:user_id]
				return true
			end
		end

		def save_login_state
			if session[:user_id]
				redirect_to(:controller => 'sessions', :action => 'home')
				return false
			else
				return true
			end
		end
end
