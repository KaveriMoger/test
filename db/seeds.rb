# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#[ 'admin', 'author'].each do |role|
  #Role.find_or_create_by({role_name: role})
#end


# create a role named "admin"
admin_role = Role.create!(:role_name => "admin")

# create an admin user
admin_user = User.create!(:email => "admin@admin.com", :password => "admin@123")

