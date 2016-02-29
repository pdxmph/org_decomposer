class AddPropertiesToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :priority, :integer
    add_column :goals, :support, :integer
  end
end
