class ChangeUserToString < ActiveRecord::Migration
  def change
    change_column :shifts, :user, :string
  end
end
