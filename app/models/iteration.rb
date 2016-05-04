# == Schema Information
#
# Table name: iterations
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class Iteration < ActiveRecord::Base
  
  validates :name, 
  			presence: true,
  			length: { minimum: 2, maximum: 50 }
  			
  has_many :tasks
  belongs_to :project
end
