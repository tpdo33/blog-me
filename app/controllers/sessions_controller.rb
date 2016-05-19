class SessionsController < ApplicationController

	def new
	end

	# create session
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:sucess] = "You have sucessfully logged in"
			redirect_to user_path(user)
		else
			flash.now[:danger] = "Email or password is invalid"
			render 'new'
		end
	end

	# logout of session
	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end
end