class PostsController < ApplicationController
	def index
		@posts = Post.order(created_at: :desc).paginate(page: params[:page], per_page: 10)
	end
end
