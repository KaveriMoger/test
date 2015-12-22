class Role < ActiveRecord::Base
	has_one :user
	validates :role_name, :presence => true
end
