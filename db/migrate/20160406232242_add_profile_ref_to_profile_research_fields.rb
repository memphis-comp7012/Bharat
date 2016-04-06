class AddProfileRefToProfileResearchFields < ActiveRecord::Migration
  def change
    add_reference :profile_research_fields, :profile, index: true, foreign_key: true
  end
end
