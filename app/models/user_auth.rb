class UserAuth < ActiveRecord::Base
	has_one :role_auth
end
