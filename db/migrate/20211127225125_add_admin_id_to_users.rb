class AddAdminIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin_id, :integer
  end
end
