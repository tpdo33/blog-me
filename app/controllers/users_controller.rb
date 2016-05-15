class UsersController < ApplicationController 

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.valid?
			user.save
			flash[:success] = "Welcome to blog me #{user.username}"
			redirect_to "/articles"
		else 
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:sucess] = " Your account was updated successfully"
			redirect_to "/articles"
		else 
			render 'edit'
		end
	end


	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end
end