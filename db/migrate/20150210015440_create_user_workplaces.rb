class CreateUserWorkplaces < ActiveRecord::Migration
  def change
    create_table :user_workplaces do |t|
      t.belongs_to :user, index: true
      t.belongs_to :workplace, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_workplaces, :users
    add_foreign_key :user_workplaces, :workplaces
  end
end
