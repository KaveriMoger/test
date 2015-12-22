class RemovePathFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :path, :string
  end
end
