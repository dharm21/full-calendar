class PostsController < ApplicationController
  before_action :authenticate_member!
  respond_to :html, :js
  before_action :set_post, only: [:edit, :show, :update,:destroy]

	def index
    @posts = Post.all
	end

	def new
		@post = current_member.posts.new
	end

	def create
    post = current_member.posts.create(post_params)
    redirect_to posts_path
  end

  def edit
  end

  def update
  	respond_to do |format|
  	  if @post.update(post_params)
	      format.html {redirect_to posts_path}
		    format.js{}
	    end
  	end
  end

  def show
  end

  def destroy
  	respond_to do |format|
  	  if @post.destroy
		    format.html {redirect_to posts_path}
			  format.js{}
			end
  	end
  end

	protected
	def post_params
		params.require(:post).permit(:content, :image)
	end

	def set_post
		@post = Post.find_by_id(params[:id])
	end
end
