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

chandra_profile = Profile.create!(first_name: "Chandra",
	last_name: "Challapalla", 
	bio: "love your work and you wont work for your love", 
	education_level: 1, 
	phone_number: 1234567890, 
	summary_of_projects: "web dev guru", 
	skills: "rails, php, laravel, composer, git")

chandra_profile.user = chandra

lasya_profile = Profile.create!(first_name: "Lasya", 
	last_name: "Vallabhaneneneni", 
	bio: "ruchi's roommate", 
	education_level: 1, 
	phone_number: 0987654321, 
	summary_of_projects: "IIS", 
	skills: "making other people happy")

lasya_profile.user = lasya

jobin_profile = Profile.create!(first_name: "Jobin", 
	last_name: "Sunny", 
	bio: "Iron man in real life", 
	education_level: 1, 
	phone_number: 8165016767, 
	summary_of_projects: "beating rakshit in CS", 
	skills: "going from my house to that other house in 5 seconds")

jobin_profile.user = jobin

megha_profile = Profile.create!(first_name: "Megaji", 
	last_name: "Vashisht", 
	bio: "A girl that wears a grey long sleeve jacket", 
	education_level: 1, 
	phone_number: 1234509876, 
	summary_of_projects: "database pr0", 
	skills: "avoiding stalkers, being short tempered, seeing red instead of few people")

megha_profile.user = megha

scott_profile = Profile.create!(first_name: "Scott", 
	last_name: "Fleming", 
	bio: "", 
	education_level: 2, 
	phone_number: 1029384756, 
	summary_of_projects: "", 
	skills: "bla")

scott_profile.user = scott



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

chandra_profile.profile_research_fields << mcell << protein

megha_profile.profile_research_fields << mark << nt

jobin_profile.profile_research_fields << nlp << ml

lasya_profile.profile_research_fields << comb << neuro

scott_profile.profile_research_fields << hci << mark



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
	status: 'in_progress',
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

