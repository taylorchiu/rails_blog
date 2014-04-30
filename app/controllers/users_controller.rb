class UsersController < ApplicationController

	before_action :signed_in_user, only: [:create, :new, :edit, :update, :destroy]
	before_action :check_post_owner, only: [:edit, :update, :destroy]

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Welcome to the Rails Blog!"
			sign_in @user
			redirect_to @users
		else
			flash[:error] = "Failed to create account. Try again."
			redirect_to signup_path
		end
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
		redirect_to @user
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
