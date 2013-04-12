class AddOrganizationIdToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :organization_id, :integer
  end
end
