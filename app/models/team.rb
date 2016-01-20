class Team < ActiveRecord::Base
  validates :team_name, :team_head, :summary, :presence => true
  has_many :documents
  has_and_belongs_to_many :clients




  def self.search(search)
    # where(:title, query) -> This would return an exact match of the query
    where("team_name like ?", "%#{search}%")

  end
end
