class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :team_head
      t.text :summary

      t.timestamps
    end
  end
end
