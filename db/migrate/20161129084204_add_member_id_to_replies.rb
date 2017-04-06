class AddMemberIdToReplies < ActiveRecord::Migration
  def change
    add_column :replies, :member_id, :integer
  end
end
