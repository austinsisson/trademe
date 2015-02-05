class CreateWorkplaces < ActiveRecord::Migration
  def change
    create_table :workplaces do |t|
      t.string :state
      t.string :city
      t.string :address

      t.timestamps null: false
    end
  end
end
