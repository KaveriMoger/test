class RemoveTnameFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :tname, :string
  end
end
