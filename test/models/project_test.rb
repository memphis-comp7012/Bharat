# == Schema Information
#
# Table name: projects
#
#  id               :integer          not null, primary key
#  name             :string
#  status           :integer
#  description      :string
#  start_date       :date
#  end_date         :date
#  funding          :decimal(10, 2)
#  difficulty_level :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  department_id    :integer
#  user_id          :integer
#


require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
