class AddFeaturesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :handle, :string
    add_column :users, :super, :boolean
    add_column :users, :admin, :boolean
  end
end
