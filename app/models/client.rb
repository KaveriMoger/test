class Client < ActiveRecord::Base
  validates :c_name, :c_email, :c_website, :c_country, presence:true
  has_and_belongs_to_many :documents
  has_and_belongs_to_many :teams

  def self.search(search)
    # where(:title, query) -> This would return an exact match of the query
    where("c_name like ?", "%#{search}%")

  end
end
