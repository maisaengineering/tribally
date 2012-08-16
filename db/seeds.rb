# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :fname => 'Tribally', :lname => 'Maisa', :email => 'triballymaisa@gmail.com', :password => 'maisa1234', :password_confirmation => 'maisa1234', :confirmed_at => Time.now.utc
puts 'New user created: ' << user.fname
admin = AdminUser.create :email => 'triballymaisa@gmail.com', :password => 'maisa1234', :password_confirmation => 'maisa1234'
puts 'New admin created: ' << admin.email
