class UsersController < ApplicationController
	load_and_authorize_resource

	def index
		@users = User.all.order(updated_at: :desc).paginate(page: params[:page], per_page: 5)
	end

	def show
	end

	def edit
	end

	def update
		if @user.update_attributes users_params
			flash[:success] = "Update success"
			redirect_to user_path(@user)
		else
			render :edit
			flash[:danger] = "Update failed"
		end
	end

	private

	def users_params
		params.require(:user).permit :avatar, :name, :email, :address, :phonenumber, :birth_day
	end
end