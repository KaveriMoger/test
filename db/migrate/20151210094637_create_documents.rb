class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :dname
      t.string :dauthor
      t.text :description
      t.string :tname

      t.timestamps
    end
  end
end
