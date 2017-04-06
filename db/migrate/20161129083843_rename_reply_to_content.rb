class RenameReplyToContent < ActiveRecord::Migration
  def change
    rename_column :replies, :reply, :content
  end
end
