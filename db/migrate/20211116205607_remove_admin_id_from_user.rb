class RemoveAdminIdFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :admin_id
  end
end
