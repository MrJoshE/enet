class RenameColumnInUsersFromisAdminToisAdmin < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :isAdmin, :is_admin
  end
end
