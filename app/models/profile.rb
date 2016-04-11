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
#  department_id       :integer
#


class Profile < ActiveRecord::Base

	enum education_level: [:undergraduate, :graduate, :phd]

	validates :first_name,
			  length: { maximum: 225 },
			  presence: true
	validates :last_name,
			  length: { maximum: 225 },
			  presence: true
	validates :education_level,
			  presence: true,
			  inclusion: {
	  			in: education_levels.keys,
	 			message: "must be either " + education_levels.keys.join(" or ")
              }
	validates :phone_number,
			  length: {is: 10}

	has_one :user
	has_many :profile_research_fields
	belongs_to :department
end
