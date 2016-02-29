class AddParentIdToGoal < ActiveRecord::Migration
  def change
    add_column :goals, :parent_id, :integer
  end
end
