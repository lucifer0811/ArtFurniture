class Admin::UsersController < ApplicationController
	load_and_authorize_resource

	def show
	end

	def index
		@users = User.all.order(updated_at: :desc).paginate(page: params[:page], per_page: 5)
	end

	def destroy
		@user.destroy
		respond_to do |format|
			format.html {redirect_to admin_users_path, success: 'User has been destroyed.'}
			format.js
			format.json {head :no_content}
		end
	end
end