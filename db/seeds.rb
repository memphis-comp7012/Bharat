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

chandra = User.new :email => 'cchllpll@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
#chandra.teams << team1 << team2 << team5
chandra.save!

lasya = User.new :email => 'svllbhnn@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
#lasya.teams << team4 << team5 << team3
lasya.save!

megha = User.new :email => 'mvshisht@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
#megha.teams << team3 << team4
megha.save!

jobin = User.new :email => 'jjsunny@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'student'
jobin.teams << team3
jobin.save!

scott = User.new :email => 'Scott.Fleming@memphis.edu', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 'faculty'
scott.teams << team1 << team2 << team4 << team5
#scott.contributions << contribution3 << contribution5
scott.save!

# Department seeds
cs = Department.create!(name: "Computer Science")
math = Department.create!(name: "Math")
biology = Department.create!(name: "Biology")
physics = Department.create!(name: "Physics")
chemistry = Department.create!(name: "Chemistry")

# Research Field seeds
nlp = ResearchField.create!(category: "Natural Language Processing")
ml = ResearchField.create!(category: "Machine Learning")
hci = ResearchField.create!(category: "Human Computer Interaction")
se = ResearchField.create!(category: "Software Engineering")
db = ResearchField.create!(category: "Databases")

mark = ResearchField.create!(category: "Markov Logic Gates")
nt = ResearchField.create!(category: "Number Theory")
comb = ResearchField.create!(category: "Combinatorics")
game_theory = ResearchField.create!(category: "Game Theory")
prob = ResearchField.create!(category: "Probability")

mcell = ResearchField.create!(category: "Molecular Cell Biology")
protein = ResearchField.create!(category: "Protein Dynamics")
neuro = ResearchField.create!(category: "NeuroBiology")
micro = ResearchField.create!(category: "MicroBiology")
genetics = ResearchField.create!(category: "Genetics")

beam = ResearchField.create!(category: "Beam Physics")
genrel = ResearchField.create!(category: "General Relativity")
nuclear = ResearchField.create!(category: "Nuclear Physics")
part = ResearchField.create!(category: "Particle Physics")
astro = ResearchField.create!(category: "Astro Physics")

catalysis = ResearchField.create!(category: "Catalysis")
solvents = ResearchField.create!(category: "Solvents")
sustainable = ResearchField.create!(category: "Sustainable Chemistry")
organic = ResearchField.create!(category: "Organic Chemistry")
liquid = ResearchField.create!(category: "Liquid Crystals")

cs.research_fields << nlp << ml << hci << se << db
math.research_fields << mark << nt << comb << game_theory << prob
biology.research_fields << mcell << protein << neuro << micro << genetics
physics.research_fields << beam << genrel << nuclear << part << astro
chemistry.research_fields << catalysis << solvents << sustainable << organic << liquid


# Profile seeds
chandra_profile = Profile.create!(first_name: "Chandra",
                                  last_name: "Challapalla",
                                  bio: "Love what you do and you will never work again in your life.",
                                  education_level: 1,
                                  phone_number: 1234567890,
                                  summary_of_projects: "Worked throughout the front-end stack on a SaaS product for property managers that has been in business for more than ten years and has over 10,000 customers.",
                                  skills: "PHP Frameworks: Laravel, Zend Framework, CodeIgniter, CakePHP.")

chandra_profile.user = chandra

lasya_profile = Profile.create!(first_name: "Lasya",
                                last_name: "Vallabhaneni",
                                bio: "I enjoy learning and becoming a bit better every day!",
                                education_level: 1,
                                phone_number: 9987654321,
                                summary_of_projects: "Student worker at IIS, worked on many web development projects.",
                                skills: "C++, PHP, Ruby on Rails, Javascript")

lasya_profile.user = lasya

jobin_profile = Profile.create!(first_name: "Jobin",
                                last_name: "Sunny",
                                bio: "A graduate student in the University of Memphis, eager to learn and apply my skills to real world projects.",
                                education_level: 1,
                                phone_number: 8165016767,
                                summary_of_projects: "Created Room8, a chore and bill management android app",
                                skills: "Java, Python, C, C++, Ruby")

jobin_profile.user = jobin

megha_profile = Profile.create!(first_name: "Megha",
                                last_name: "Vashisht",
                                bio: "",
                                education_level: 1,
                                phone_number: 1234509876,
                                summary_of_projects: "Worked at HCL on backend technologies.",
                                skills: "PHP, Python, Javascript, SQL. Databases used: Oracle, Apache Tomcat")

megha_profile.user = megha

scott_profile = Profile.create!(first_name: "Dr. Scott",
                                last_name: "Fleming",
                                bio: "I take a human-centric approach, empirically studying developers to inspire and evaluate tools. I am interested in a variety of different programming populations, including experienced professionals, new computer science graduates, and end-user programmers.",
                                education_level: 2,
                                phone_number: 1029384756,
                                summary_of_projects: "Information Foraging in Software Engineering, Gender-HCI, Copse Project",
                                skills: "Java, Ruby, Rails")

scott_profile.user = scott

# Chandra Profile Research Fields
chandra_profile_research_fields1 = ProfileResearchField.create!()
chandra_profile_research_fields2 = ProfileResearchField.create!()
chandra_profile_research_fields3 = ProfileResearchField.create!()
chandra_profile.profile_research_fields << chandra_profile_research_fields1 << chandra_profile_research_fields2 << chandra_profile_research_fields3
nlp.profile_research_fields << chandra_profile_research_fields1
hci.profile_research_fields << chandra_profile_research_fields2
se.profile_research_fields << chandra_profile_research_fields3

# Megha Profile Research Fields
megha_profile_research_fields1 = ProfileResearchField.create!()
megha_profile_research_fields2 = ProfileResearchField.create!()
megha_profile_research_fields3 = ProfileResearchField.create!()
megha_profile.profile_research_fields << megha_profile_research_fields1 << megha_profile_research_fields2 << megha_profile_research_fields3
db.profile_research_fields << megha_profile_research_fields1
nt.profile_research_fields << megha_profile_research_fields2
comb.profile_research_fields << megha_profile_research_fields3

# Lasya Profile Research Fields
lasya_profile_research_fields1 = ProfileResearchField.create!()
lasya_profile_research_fields2 = ProfileResearchField.create!()
lasya_profile_research_fields3 = ProfileResearchField.create!()
lasya_profile.profile_research_fields << lasya_profile_research_fields1 << lasya_profile_research_fields2 << lasya_profile_research_fields3
mcell.profile_research_fields << lasya_profile_research_fields1
protein.profile_research_fields << lasya_profile_research_fields2
genetics.profile_research_fields << lasya_profile_research_fields3

# Jobin Profile Research Fields
jobin_profile_research_fields1 = ProfileResearchField.create!()
jobin_profile_research_fields2 = ProfileResearchField.create!()
jobin_profile_research_fields3 = ProfileResearchField.create!()
jobin_profile.profile_research_fields << jobin_profile_research_fields1 << jobin_profile_research_fields2 << jobin_profile_research_fields3
beam.profile_research_fields << jobin_profile_research_fields1
genrel.profile_research_fields << jobin_profile_research_fields2
astro.profile_research_fields << jobin_profile_research_fields3

# Prof. Scott Profile Research Fields
scott_profile_research_fields1 = ProfileResearchField.create!()
scott_profile_research_fields2 = ProfileResearchField.create!()
scott_profile_research_fields3 = ProfileResearchField.create!()
scott_profile.profile_research_fields << scott_profile_research_fields1 << scott_profile_research_fields2 << scott_profile_research_fields3
hci.profile_research_fields << scott_profile_research_fields1
se.profile_research_fields << scott_profile_research_fields2
prob.profile_research_fields << scott_profile_research_fields3

cs.profiles << chandra_profile << scott_profile
math.profiles << megha_profile
biology.profiles << lasya_profile
physics.profiles << jobin_profile

# Project and Team association seeds
jar = Project.new(
    name: "J.A.R.V.I.S",
    status: 'not_started',
    description: "This has not started",
    start_date: Time.now+1.day,
    end_date: Time.now+90.day,
    funding: 2000,
    difficulty_level: 'easy'
)
jar.department = cs
jar.user = chandra
jar.teams << team2

iteration1 = Iteration.create!(name: "JARVIS Iteration One")
iteration2 = Iteration.create!(name: "JARVIS Iteration Two")
jar.iterations << iteration1 << iteration2

creation_task1 = Task.create!(name: "Creation Task", description: "Create a Robot", status: 'in_progress', assigned_user: 5, due_date: Time.now+9.day, user_id: 1)
authentication_task2 = Task.create!(name: "Authentication Task ", description: "Friends only should enter the House", status: 'in_progress', assigned_user: 5, due_date: Time.now+9.day, user_id: 1)
security_task3 = Task.create!(name: "Security Task", description: "Keep the House secure", status: 'in_progress', assigned_user: 5, due_date: Time.now+10.day, user_id: 1)
iteration1.tasks << creation_task1 << authentication_task2
iteration2.tasks << security_task3

jar.save!

se = Project.new(
    name: "Information Foraging in Software Engineering",
    status: 'in_progress',
    description: "This is a project on Information Foraging ",
    start_date: Time.now+5.day,
    end_date: Time.now+90.day,
    funding: 10000,
    difficulty_level: 'medium')
se.department = cs
se.user = chandra
#se.contribution = contribution1
#se.teams << team3 << team2 << team1 << team5 << team3

iteration3 = Iteration.create!(name: "Information Foraging Iteration One")
iteration4 = Iteration.create!(name: "Information Foraging Iteration Two")
se.iterations << iteration3 << iteration4

refactoring_task1 = Task.create!(name: "Refactoring", description: "Refactor the code to remove code smells", status: 'complete', assigned_user: 1, due_date: Time.now+3.day, user_id: 1)
removeduplicate_task2 = Task.create!(name: "Remove Duplications", description: "For better functionality remove the duplications", status: 'in_progress', assigned_user: 1, due_date: Time.now+4.day, user_id: 1)
testing_task3 = Task.create!(name: "Testing", description: "Test the code after development is done", status: 'not_started', assigned_user: 1, due_date: Time.now+6.day, user_id: 1)
tasksetup_task4 = Task.create!(name: "Task Setup Environment", description: "Setup the environment for checking the duplications", status: 'on_hold', assigned_user: 1, due_date: Time.now+9.day, user_id: 1)
iteration3.tasks << refactoring_task1 << tasksetup_task4
iteration4.tasks << removeduplicate_task2 << testing_task3


se.save!

track = Project.new(
    name: "Conference Tracking System",
    status: 'not_started',
    description: "Project on Conference tracking System",
    start_date: Time.now+10.day,
    end_date: Time.now+190.day,
    funding: 6000,
    difficulty_level: 'hard')
track.department = math
track.user = lasya
#track.contribution = contribution2
track.teams << team1

iteration5 = Iteration.create!(name: "Conference Tracking Iteration One")
iteration6 = Iteration.create!(name: "Conference Tracking Iteration Two")
track.iterations << iteration5 << iteration6
registration_task1 = Task.create!(name: "Registration", description: "Register to the conference before being a user to Tracking sysyem", status: 'complete', assigned_user: 5, due_date: Time.now+3.day, user_id: 2)
complete_task2 = Task.create!(name: "Complete Code Academy", description: "Complete course in code academy to know about tracking system", status: 'in_progress', assigned_user: 2, due_date: Time.now+1.day, user_id: 2)
writeexam_task3 = Task.create!(name: "Write Exam", description: "Complete exams for practice and show credits", status: 'not_started', assigned_user: 5, due_date: Time.now+2.day, user_id: 2)
iteration5.tasks << registration_task1
iteration6.tasks << complete_task2 << writeexam_task3

track.save!

smoke = Project.new(
    name: "Smoke Abstinence",
    status: 'on_hold',
    description: "A project on Smoke Abstinence",
    start_date: Time.now+10.day,
    end_date: Time.now+100.day,
    funding: 5000,
    difficulty_level: 'easy')
smoke.department = math
smoke.user = lasya
#smoke.teams << team5

iteration7 = Iteration.create!(name: "Smoke Abstinence Iteration One")
iteration8 = Iteration.create!(name: "Smoke Abstinence Iteration Two")
smoke.iterations << iteration7 << iteration8

smoke.save!

authen = Project.new(
    name: "Authentication Framework",
    status: 'complete',
    description: "This is a project on Authentication Framework",
    start_date: Time.now+4.day,
    end_date: Time.now+80.day,
    funding: 6200,
    difficulty_level: 'hard')

authen.teams << team5
authen.department = biology
authen.user = megha

iteration9 = Iteration.create!(name: "Authentication Iteration One")
iteration10 = Iteration.create!(name: "Authentication Iteration Two")
authen.iterations << iteration9 << iteration10

authen.save!


genetic = Project.new(
    name: "Tsp problem",
    status: 'complete',
    description: "This is a project on TSP using genetic",
    start_date: Time.now+20.day,
    end_date: Time.now+90.day,
    funding: 6200,
    difficulty_level: 'hard')
genetic.teams << team4 << team3
genetic.department = biology
genetic.user = chandra

iteration11 = Iteration.create!(name: "TSP Iteration One")
iteration12 = Iteration.create!(name: "TSP Iteration Two")
genetic.iterations << iteration11 << iteration12

genetic.save!


# Contribution seeds
contribution1 = Contribution.new :score => 50, money_received: 5000
contribution1.user = megha
contribution1.project = smoke
contribution1.save!

contribution2 = Contribution.new :score => 100, money_received: 10000
contribution2.user = jobin
contribution2.project = authen
contribution2.save!

contribution3 = Contribution.new :score => -10, money_received: 0
contribution3.user = scott
contribution3.project = genetic
contribution3.save!

contribution4 = Contribution.new :score => -50, money_received: 0
contribution4.user = lasya
contribution4.project = authen
contribution4.save!

contribution5 = Contribution.new :score => -100, money_received: 0
contribution5.user = scott
contribution5.project = jar
contribution5.save!

#requests seeds
request1 = Request.new :project_id => 6, :user_id => 2, :type => 0, :status => 1
request1.save!
request2 = Request.new :project_id => 6, :user_id => 2, :type => 1, :status => 0
request2.save!
request3 = Request.new :project_id => 6, :user_id => 3, :type => 0, :status => 1
request3.save!
request4 = Request.new :project_id => 6, :user_id => 3, :type => 1, :status => 2
request4.save!

# Project research fields
project_research_field1 = ProjectResearchField.new :project_id => 1, :research_field_id => 1
project_research_field1.save!
project_research_field2 = ProjectResearchField.new :project_id => 2, :research_field_id => 2
project_research_field2.save!
project_research_field3 = ProjectResearchField.new :project_id => 3, :research_field_id => 3
project_research_field3.save!
project_research_field4 = ProjectResearchField.new :project_id => 4, :research_field_id => 4
project_research_field4.save!
project_research_field5 = ProjectResearchField.new :project_id => 5, :research_field_id => 5
project_research_field5.save!
