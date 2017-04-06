class AddAttachmentToComments < ActiveRecord::Migration
  def change
    add_column :comments, :image, :attachment
  end
end
