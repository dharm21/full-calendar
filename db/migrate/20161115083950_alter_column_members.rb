class AlterColumnMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.change :address, :text
    end
  end
  def self.down
    change_table :members do |t|
      t.change :address, :string
    end
  end
end
