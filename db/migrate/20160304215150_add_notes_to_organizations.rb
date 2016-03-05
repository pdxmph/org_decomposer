class AddNotesToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :note, :text
    add_column :organizations, :rendered_note, :text
  end
end
