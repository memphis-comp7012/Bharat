class AddResearchFieldRefToProfileResearchFields < ActiveRecord::Migration
  def change
    add_reference :profile_research_fields, :research_field, index: true, foreign_key: true
  end
end
