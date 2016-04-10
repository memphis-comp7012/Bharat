# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Department seeds
cs = Department.create!(name: "Computer Science")
math = Department.create!(name: "Math")
biology = Department.create!(name: "Biology")

# research field seeds
nlp = ResearchField.create!(category: "Natural Language Processing")
ml = ResearchField.create!(category: "Machine Learning")
hci = ResearchField.create!(category: "Human Computer Interaction")

mark = ResearchField.create!(category: "Markov Logic Gates")
nt = ResearchField.create!(category: "Number Theory")
comb = ResearchField.create!(category: "Combinatorics")

mcell = ResearchField.create!(category: "Molecular Cell Biology")
protein = ResearchField.create!(category: "Protein Dynamics")
neuro = ResearchField.create!(category: "NeuroBiology")

# Research fields for departments
cs.research_fields << nlp << ml << hci
math.research_fields << mark << nt << comb
biology.research_fields << mcell << protein << neuro

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

# user seeds and associations
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
jar.user = chandra
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
se.user = chandra
se.save!

track = Project.new(name: "Conference Tracking System",
										status: 'not_started',
										description: "Project on Conference tracking System",
										start_date: "2016-06-10",
										end_date: "2017-07-20",
										funding: 6000,
										difficulty_level: 'hard')
track.teams << team4 << team3
track.user = chandra
track.save!

smoke = Project.new(name: "Smoke Abstinence",
										status: 'on_hold',
										description: "A project on Smoke Abstinence",
										start_date: "2016-08-10",
										end_date: "2017-09-20",
										funding: 5000,
										difficulty_level: 'easy')
smoke.teams << team1
smoke.user = chandra
smoke.save!

authen = Project.new(name: "Authentication Framework",
										 status: 'complete',
										 description: "This is a project on Authentication Framework",
										 start_date: "2016-10-10",
										 end_date: "2017-11-20",
										 funding: 6200,
										 difficulty_level: 'hard')
authen.user = chandra
authen.save!

genetic = Project.new(name: "Tsp problem",
											status: 'complete',
											description: "This is a project on TSP using genetic",
											start_date: "2016-11-10",
											end_date: "2017-09-20",
											funding: 6200,
											difficulty_level: 'hard')
genetic.user = chandra
genetic.teams << team4 << team2
genetic.contribution = contribution1
genetic.save!


# Project research fields seeds
proj_resfield1 =  ProjectResearchField.create!()
proj_resfield1.project = jar
proj_resfield1.research_field = nlp

proj_resfield2 =  ProjectResearchField.create!()

