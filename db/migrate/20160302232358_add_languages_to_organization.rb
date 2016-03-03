class AddLanguagesToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :languages, :string
  end
end
