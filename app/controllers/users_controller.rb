class UsersController < ApplicationController
	load_and_authorize_resource

	def index
		@users = User.order(updated_at: :desc).paginate(page: params[:page], per_page: 5)
	end

	def show
	end

	def edit
	end

	def update
		if @user.update_attributes user_params
			flash[:success] = "Update success"
			redirect_to user_path(@user)
		else
			render :edit
			flash[:danger] = "Update failed"
		end
	end

	private

	def user_params
		params.require(:user).permit :id, images_attributes: [:id, :imageable_id, :imageable_type, :picture]
	end
end