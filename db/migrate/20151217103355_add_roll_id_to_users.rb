class AddRollIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :roll_id, :integer
  end
end
