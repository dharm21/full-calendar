class LikesController < ApplicationController
  before_action :authenticate_member!
  
  def new
    @like = Like.new
  end

  def create
    if params[:post_id]
			@post = Post.find_by_id(params[:post_id])
			@like = @post.likes.where(member_id: current_member.id)
			@like = @like.first_or_create(member_id: current_member.id)
		  #@like = @post.likes.new(member_id: current_member.id)
		elsif params[:comment_id]
			@comment = Comment.find_by_id(params[:comment_id])
			@like = @comment.likes.where(member_id: current_member.id)
			@like = @like.first_or_create(member_id: current_member.id)
		elsif params[:reply_id]
      @reply = Reply.find_by_id(params[:reply_id])
      @like = @reply.likes.where(member_id: current_member.id)
			@like = @like.first_or_create(member_id: current_member.id)
		end

		@like.like = params[:like]
    respond_to do |format|
      if @like.save
        format.html{redirect_to posts_path}
    	  format.js{}
    	end
    end
  end
  
  def destroy

  	if params[:post_id]
      @post = Post.find_by_id(params[:post_id])
    	@like = @post.likes.find_by_member_id(current_member.id)

    elsif params[:comment_id]
  	  @comment = Comment.find(params[:comment_id])
  	  @like = @comment.likes.find_by_member_id(current_member.id)

	  elsif params[:reply_id]
		  @reply = Reply.find(params[:reply_id])
		  @like = @reply.likes.find_by_member_id(current_member.id)
		end
    @like.like = params[:like]
    respond_to do |format|
		  if @like.destroy
		    format.html{redirect_to posts_path}
			  format.js
		  end
	  end
  end
end