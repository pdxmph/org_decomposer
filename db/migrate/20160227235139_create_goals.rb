class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.string :kind
      t.integer :organization_id
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
