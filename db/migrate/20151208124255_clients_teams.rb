class ClientsTeams < ActiveRecord::Migration
  def change
   create_table :clients_teams, :id => false do |t|
   t.integer :client_id
   t.integer :team_id
   end
  end
end
