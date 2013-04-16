class AddOrganizationNameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :organization_name, :string
  end
end
