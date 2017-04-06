class RepliesController < ApplicationController
  before_action :set_comment, only: [:new, :create, :edit, :update, :destroy]

  def new
    @reply = Reply.new
  end

  def create
	  @reply = @comment.replies.new(replies_params)
    @reply.member_id = current_member.id
	  respond_to do |format|
      if @reply.save 
        # format.html {redirect_to posts_path}
        format.js{}
      end
    end
  end

  def edit
	@reply = Reply.find(params[:id])
  end

  def update
    @reply = Reply.find(params[:id])
	  respond_to do |format|
      if @reply.update(replies_params)
        # format.html {redirect_to posts_path}
        format.js{}
      end
    end
  end

  def destroy
		@reply = Reply.find(params[:id])
		respond_to do |format|
      if @comment.replies.find(params[:id]).destroy
        format.html {redirect_to posts_path}
        format.js{}
      end
    end
	end

	protected
	def replies_params
		params.require(:reply).permit(:content, :member_id)		
	end

	def set_comment
		@comment  = Comment.find(params[:comment_id])
	end
end
