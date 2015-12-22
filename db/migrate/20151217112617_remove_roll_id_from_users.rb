class RemoveRollIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :roll_id, :integer
  end
end
