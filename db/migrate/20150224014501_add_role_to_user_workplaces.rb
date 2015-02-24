class AddRoleToUserWorkplaces < ActiveRecord::Migration
  def change
    add_column :user_workplaces, :role, :string
  end
end
