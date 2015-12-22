class CreateRoleAuths < ActiveRecord::Migration
  def change
    create_table :role_auths do |t|
      t.string :role_name
      t.integer :user_id

      t.timestamps
    end
  end
end
