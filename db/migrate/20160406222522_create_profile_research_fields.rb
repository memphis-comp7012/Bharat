class CreateProfileResearchFields < ActiveRecord::Migration
  def change
    create_table :profile_research_fields do |t|

      t.timestamps null: false
    end
  end
end
