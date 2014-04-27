class AddNextPlayerToTtt < ActiveRecord::Migration
  def change
    add_column :ttts, :next_player, :integer
  end
end
