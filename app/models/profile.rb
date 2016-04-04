class Profile < ActiveRecord::Base
	validates :name, presence: true
end
