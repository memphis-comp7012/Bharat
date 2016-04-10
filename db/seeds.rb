# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

chandra = User.create! :email => 'cchllpll@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
lasya = User.create! :email => 'svllbhnn@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
megha = User.create! :email => 'mvshisht@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
jobin = User.create! :email => 'jjsunny@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
scott = User.create! :email => 'Scott.Fleming@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'faculty'

#jobin_profile = Profile.create!(first_name: "Jobin", last_name: "Sunny", bio: "blah blah", education_level: 1, phone_number: 8165016767, summary_of_projects: "blah blah blah", skills: "bla")
#jobin_profile.user = jobin

cs = Department.create!(name: "Computer Science")
math = Department.create!(name: "Math")
biology = Department.create!(name: "Biology")

nlp = ResearchField.create!(category: "Natural Language Processing")
ml = ResearchField.create!(category: "Machine Learning")
hci = ResearchField.create!(category: "Human Computer Interaction")

mark = ResearchField.create!(category: "Markov Logic Gates")
nt = ResearchField.create!(category: "Number Theory")
comb = ResearchField.create!(category: "Combinatorics")

mcell = ResearchField.create!(category: "Molecular Cell Biology")
protein = ResearchField.create!(category: "Protein Dynamics")
neuro = ResearchField.create!(category: "NeuroBiology")

cs.research_fields << nlp << ml << hci
math.research_fields << mark << nt << comb
biology.research_fields << mcell << protein << neuro

#megha_project = Project.crate!(name: , status: , description: , start_date: , end_date : , funding: , difficulty_level: )
#data seed for Projects table below

jar = Project.create!(
	name: "J.A.R.V.I.S",
	status: 'in_progress',
	description: "This has not started",
	start_date: "2016-04-10",
	end_date: "2016-04-20",
	funding: 2000,
	difficulty_level: 'easy'
	)

se = Project.create!(name: "Information Foraging in Software Engineering",
	status: 'complete',
	description: "This is a project on Information Foraging ",
	start_date: "2016-05-10",
	end_date: "2017-06-20",
	funding: 10000,
	difficulty_level: 'medium')

track = Project.create!(name: "Conference Tracking System",
	status: 'not_started',
	description: "Project on Conference tracking System",
	start_date: "2016-06-10",
	end_date: "2017-07-20",
	funding: 6000,
	difficulty_level: 'hard')

smoke = Project.create!(name: "Smoke Abstinence",
	status: 'on_hold',
	description: "A project on Smoke Abstinence",
	start_date: "2016-08-10",
	end_date: "2017-09-20",
	funding: 5000,
	difficulty_level: 'easy')

authen = Project.create!(name: "Authentication Framework",
	status: 'complete',
	description: "This is a project on Authentication Framework",
	start_date: "2016-10-10",
	end_date: "2017-11-20",
	funding: 6200,
	difficulty_level: 'hard')
