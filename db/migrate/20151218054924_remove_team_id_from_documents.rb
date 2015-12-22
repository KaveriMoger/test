class RemoveTeamIdFromDocuments < ActiveRecord::Migration
  def change
    remove_column :documents, :team_id, :integer
  end
end
