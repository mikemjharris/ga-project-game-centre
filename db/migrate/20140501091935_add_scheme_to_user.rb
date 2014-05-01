class AddSchemeToUser < ActiveRecord::Migration
  def change
    add_column :users, :scheme, :integer
  end
end
