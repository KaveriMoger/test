class RemoveTeamNameFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :team_name, :string
  end
end
