class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.create(post_params(:title, :description))
	  #@post.save
	  redirect_to @post
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		# byebug
	  @post = Post.find(params[:id])
	  @post.update(post_params(:title, :description))
	  redirect_to @post
	end

	private

		def post_params(*args)
			params.require(:post).permit(*args)
		end

end
