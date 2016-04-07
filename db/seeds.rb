# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

chandra = User.create! :email => 'cchllpll@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret'
lasya = User.create! :email => 'svllbhnn@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret'
megha = User.create! :email => 'mvshisht@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret'
jobin = User.create! :email => 'jjsunny@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret'

#jobin_profile = Profile.create!(first_name: "Jobin", last_name: "Sunny", bio: "blah blah", education_level: 1, phone_number: 8165016767, summary_of_projects: "blah blah blah", skills: "bla")
#jobin_profile.user = jobin

cs = Department.create!(name: "Computer Science")
math = Department.create!(name: "Math")
physics = Department.create!(name: "Physics")
biology = Department.create!(name: "Biology")

nlp = ResearchField.create!