class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.integer :education_level
      t.integer :phone_number
      t.text :summary_of_projects
      t.text :skills

      t.timestamps null: false
    end
  end
end
