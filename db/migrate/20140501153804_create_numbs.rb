class CreateNumbs < ActiveRecord::Migration
  def change
    create_table :numbs do |t|
      t.integer :s1
      t.integer :s2
      t.integer :s3
      t.integer :s4
      t.integer :s5
      t.integer :s6
      t.integer :s7
      t.integer :s8
      t.integer :s9
      t.integer :s10
      t.integer :s11
      t.integer :s12
      t.integer :s13
      t.integer :s14
      t.integer :s15
      t.integer :s16
      t.integer :user_id

      t.timestamps
    end
  end
end
