class AddScoreToNumbs < ActiveRecord::Migration
  def change
    add_column :numbs, :score, :integer
  end
end
