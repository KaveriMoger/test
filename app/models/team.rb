class Team < ActiveRecord::Base
	validates :team_name, :team_head, :summary, :presence => true
	has_many :documents
	has_and_belongs_to_many :clients
end
