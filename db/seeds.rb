# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Team seeds
team1 = Team.create!()
team2 = Team.create!()
team3 = Team.create!()
team4 = Team.create!()
team5 = Team.create!()

# Contribution seeds
contribution1 = Contribution.new :score => 50, money_received: 5000
contribution2 = Contribution.new :score => 100, money_received: 10000
contribution3 = Contribution.new :score => -100, money_received: 0
contribution4 = Contribution.new :score => 0, money_received: 0
contribution5 = Contribution.new :score => 0, money_received: 0


# Project and Team association seeds
jar = Project.new(
		name: "J.A.R.V.I.S",
		status: 'in_progress',
		description: "This has not started",
		start_date: "2016-04-10",
		end_date: "2016-04-20",
		funding: 2000,
		difficulty_level: 'easy'
)
jar.teams << team1 << team2
jar.save!

se = Project.new(name: "Information Foraging in Software Engineering",
								 status: 'in_progress',
								 description: "This is a project on Information Foraging ",
								 start_date: "2016-05-10",
								 end_date: "2017-06-20",
								 funding: 10000,
								 difficulty_level: 'medium')
se.teams << team3 << team2
se.save!

track = Project.new(name: "Conference Tracking System",
										status: 'not_started',
										description: "Project on Conference tracking System",
										start_date: "2016-06-10",
										end_date: "2017-07-20",
										funding: 6000,
										difficulty_level: 'hard')
track.teams << team4 << team3
track.save!

smoke = Project.new(name: "Smoke Abstinence",
										status: 'on_hold',
										description: "A project on Smoke Abstinence",
										start_date: "2016-08-10",
										end_date: "2017-09-20",
										funding: 5000,
										difficulty_level: 'easy')
smoke.teams << team1
smoke.save!

authen = Project.new(name: "Authentication Framework",
										 status: 'complete',
										 description: "This is a project on Authentication Framework",
										 start_date: "2016-10-10",
										 end_date: "2017-11-20",
										 funding: 6200,
										 difficulty_level: 'hard')

genetic = Project.new(name: "Tsp problem",
											status: 'complete',
											description: "This is a project on TSP using genetic",
											start_date: "2016-11-10",
											end_date: "2017-09-20",
											funding: 6200,
											difficulty_level: 'hard')
genetic.teams << team4 << team2
genetic.contribution = contribution1
genetic.save!

chandra = User.new :email => 'cchllpll@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
chandra.teams << team1
chandra.contributions << contribution3
chandra.save!

lasya = User.new :email => 'svllbhnn@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
lasya.teams << team1
lasya.teams << team2
lasya.save!

megha = User.new :email => 'mvshisht@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
megha.teams << team3
megha.save!

jobin = User.new :email => 'jjsunny@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
jobin.contributions << contribution1
jobin.teams << team1
jobin.save!

scott = User.new :email => 'Scott.Fleming@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'faculty'
scott.teams << team4 << team1 << team2
scott.contributions << contribution2
scott.save!

chandra_profile = Profile.create!(first_name: "Chandra",
	last_name: "Challapalla", 
	bio: "love your work and you wont work for your love", 
	education_level: 'graduate', 
	phone_number: 1234567890, 
	summary_of_projects: "web dev guru", 
	skills: "rails, php, laravel, composer, git")

chandra_profile.user = chandra

lasya_profile = Profile.create!(first_name: "Lasya", 
	last_name: "Vallabhaneneneni", 
	bio: "ruchi's roommate", 
	education_level: 'undergraduate', 
	phone_number: 9987654321, 
	summary_of_projects: "IIS", 
	skills: "making other people happy")

lasya_profile.user = lasya

jobin_profile = Profile.create!(first_name: "Jobin", 
	last_name: "Sunny", 
	bio: "Iron man in real life", 
	education_level: 'undergraduate', 
	phone_number: 8165016767, 
	summary_of_projects: "beating rakshit in CS", 
	skills: "going from my house to that other house in 5 seconds")

jobin_profile.user = jobin

megha_profile = Profile.create!(first_name: "Dr. Megaji", 
	last_name: "Vashisht", 
	bio: "A girl that wears a grey long sleeve jacket", 
	education_level: 'phd', 
	phone_number: 1234509876, 
	summary_of_projects: "database pr0", 
	skills: "avoiding stalkers, being short tempered, seeing red instead of few people")

megha_profile.user = megha

scott_profile = Profile.create!(first_name: "Dr. Scott", 
	last_name: "Fleming", 
	bio: "", 
	education_level: 'phd', 
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

chandra_profile_research_fields1 = ProfileResearchField.create!()
chandra_profile_research_fields2 = ProfileResearchField.create!()
chandra_profile.profile_research_fields << chandra_profile_research_fields1
chandra_profile.profile_research_fields << chandra_profile_research_fields2
nlp.profile_research_fields << chandra_profile_research_fields1
hci.profile_research_fields << chandra_profile_research_fields2

cs.research_fields << nlp << ml << hci
math.research_fields << mark << nt << comb
biology.research_fields << mcell << protein << neuro