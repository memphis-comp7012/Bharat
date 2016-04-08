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
