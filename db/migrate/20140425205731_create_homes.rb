class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :games

      t.timestamps
    end
  end
end
