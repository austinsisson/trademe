class ChangeUserIdToUser < ActiveRecord::Migration
  def change
    rename_column :shifts, :user_id, :user
  end
end
