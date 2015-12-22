class AddTeamNameToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :team_name, :string
  end
end
