class AddSupportIdToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :support_id, :integer
  end
end
