class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :ttt_id
      t.integer :player
      t.integer :player_move

      t.timestamps
    end
  end
end
