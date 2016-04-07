class CreateResearchFields < ActiveRecord::Migration
  def change
    create_table :research_fields do |t|
      t.string :category

      t.timestamps null: false
    end
  end
end
