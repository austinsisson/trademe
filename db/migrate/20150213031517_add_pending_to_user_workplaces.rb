class AddPendingToUserWorkplaces < ActiveRecord::Migration
  def change
    add_column :user_workplaces, :pending, :boolean, default: true
  end
end
