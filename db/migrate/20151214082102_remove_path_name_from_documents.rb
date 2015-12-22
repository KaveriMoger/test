class RemovePathNameFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :path_name, :string
  end
end
