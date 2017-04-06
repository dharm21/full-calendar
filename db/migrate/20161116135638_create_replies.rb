class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
    	t.references :comment, index: true
    	t.string :reply

      t.timestamps null: false
    end
  end
end
