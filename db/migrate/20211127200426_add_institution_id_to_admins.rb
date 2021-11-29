class AddInstitutionIdToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :institution_id, :string
  end
end
