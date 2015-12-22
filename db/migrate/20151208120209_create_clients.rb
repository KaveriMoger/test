class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :c_name
      t.string :c_email
      t.string :c_website
      t.string :c_country

      t.timestamps
    end
  end
end
