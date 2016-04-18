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


require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "normal profile should be valid" do
    lasya = profiles(:lasya)
    assert lasya.valid?
  end

  test "profile with nil first name should be invalid" do
    lasya = profiles(:lasya)
    lasya.first_name = nil
    assert lasya.invalid?
  end

  test "profile with empty first name should be invalid" do
    lasya = profiles(:lasya)
    lasya.first_name = ''
    assert lasya.invalid?
  end

  test "profile with whitespace first name should be invalid" do
    lasya = profiles(:lasya)
    lasya.first_name = '              '
    assert lasya.invalid?
  end

  test "profile with first name length greater than 225 should be invalid" do
    lasya = profiles(:lasya)
    lasya.first_name = ''
    for i in 1..230 do 
      lasya.first_name = lasya.first_name+'a'
    end
    assert lasya.invalid?
  end

  test "profile with nil last name should be invalid" do
    lasya = profiles(:lasya)
    lasya.last_name = nil
    assert lasya.invalid?
  end

  test "profile with empty last name should be invalid" do
    lasya = profiles(:lasya)
    lasya.last_name = ''
    assert lasya.invalid?
  end


  test "profile with whitespace last name should be invalid" do
    lasya = profiles(:lasya)
    lasya.last_name = '               '
    assert lasya.invalid?
  end

  test "profile with last name length greater than 225 should be invalid" do
    lasya = profiles(:lasya)
    lasya.last_name = ''
    for i in 1..230 do 
      lasya.last_name = lasya.last_name+'a'
    end
    assert lasya.invalid?
  end

  test "profile with empty phone number should be invalid" do
    lasya = profiles(:lasya)
    lasya.phone_number = ''
    assert lasya.invalid?
  end

  test "profile with 11 digit phone number should be invalid" do
    lasya = profiles(:lasya)
    lasya.phone_number = 12345678900
    assert lasya.invalid?
  end

  test "profile with nil education level should be invalid" do
    lasya = profiles(:lasya)
    lasya.education_level = nil
    assert lasya.invalid?
  end

  test "profile with empty education level should be invalid" do
    lasya = profiles(:lasya)
    lasya.education_level = ''
    assert lasya.invalid?
  end

  test "profile education level enum should have right indices" do
    education_levels = [:undergraduate, :graduate, :phd]
    education_levels.each_with_index do |item, index|
      assert_same Profile.education_levels[item], index
    end
  end

  test "profile education level enum should not allow invalid enum values" do
    education_levels = [:phd, :undergraduate, :blah]
    education_levels.each_with_index do |item, index|
      assert_not_same Profile.education_levels[item], index
    end
  end
end
