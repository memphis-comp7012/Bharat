# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :string
#  status        :integer
#  assigned_user :integer
#  due_date      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
