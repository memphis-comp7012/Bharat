# == Schema Information
#
# Table name: profiles
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  bio                 :text
#  education_level     :integer
#  phone_number        :integer
#  summary_of_projects :text
#  skills              :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Profile < ActiveRecord::Base
	validates :first_name, presence: true
end
