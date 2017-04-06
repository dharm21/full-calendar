class FriendshipsController < ApplicationController
	before_action :authenticate_member!

	def index
		@members = Member.all
    #@received_friendships = current_member.received_friendships
    #@requested_friendships = current_member.requested_friendships
  end

	def new
		@friendship = Friendship.new
  end

  def create
    @friendship = current_member.invite_friendships.build(friend_id: params[:friend_id], member_id: params[:member_id])
    if @friendship.save
      redirect_to friendships_path
    end
  end

  def destroy
     @friendship = current_member.friendships.find(params[:id])
     if @friendship.destroy
      redirect_to friendship_path
    end
  end

  # private
  # def friendship_params 
  # 	params.require(:friendship).permit(:friend_id, :accepted)
  # end
end
