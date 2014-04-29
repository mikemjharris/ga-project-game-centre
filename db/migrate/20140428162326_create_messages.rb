class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id,  :references => :user_id
      t.integer :to_user_id, :references => :user_id
      t.integer :to_user
      t.string :title
      t.text :message
      t.string :type
      t.boolean :read

      t.timestamps
    end
  end
end
