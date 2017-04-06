class CommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_post, only: [:new, :create, :edit, :update, :destroy]
	
  def new
		@comment = Comment.new
	end

	def create
    @comment = @post.comments.new(comment_params)
    @comment.member_id = current_member.id
		respond_to do |format|
      if @comment.save
        format.html {redirect_to posts_path}
        format.js{}
      else
        format.html {redirect_to posts_path}
        format.js{}
      end
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    # @comment = @post.comments.where(id: params[:id]).first
    @comment = @post.comments.find_by_id(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        # format.html {redirect_to posts_path}
        format.js{}
      end
    end
  end

  def destroy
    @comment = @post.comments.find_by_id(params[:id])
    respond_to do |format|
      if @comment.destroy
        format.html {redirect_to posts_path}
        format.js{}
      end
    end
  end
	
  protected
	def comment_params
		params.require(:comment).permit(:content, :image)
  end

  def set_post
    @post = Post.find_by_id(params[:post_id])
  end
end
