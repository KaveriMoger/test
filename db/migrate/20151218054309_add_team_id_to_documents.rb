class AddTeamIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :team_id, :integer
  end
end
