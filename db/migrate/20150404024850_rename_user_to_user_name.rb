class RenameUserToUserName < ActiveRecord::Migration
  def change
    rename_column :shifts, :user, :user_name
  end
end
