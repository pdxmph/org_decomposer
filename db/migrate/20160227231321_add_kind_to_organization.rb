class AddKindToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :kind, :string
  end
end
