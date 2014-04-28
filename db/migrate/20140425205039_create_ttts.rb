class CreateTtts < ActiveRecord::Migration
  def change
    create_table :ttts do |t|
      t.integer :player_one_id , :references => :user_id
      t.integer :player_two_id , :references => :user_id
      t.integer :player_one
      t.integer :player_two
      t.integer :computer
      t.integer :player_one_position
      t.integer :player_two_position
      t.boolean :live_game
      t.integer :winner

      t.timestamps
    end
  end
end
