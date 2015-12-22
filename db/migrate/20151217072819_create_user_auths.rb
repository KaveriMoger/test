class CreateUserAuths < ActiveRecord::Migration
  def change
    create_table :user_auths do |t|
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
