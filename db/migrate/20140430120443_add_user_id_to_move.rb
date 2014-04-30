class AddUserIdToMove < ActiveRecord::Migration
  def change
    add_column :moves, :user_id, :integer
  end
end
