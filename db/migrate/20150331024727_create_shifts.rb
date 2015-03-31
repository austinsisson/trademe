class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :user_id
      t.string :name
      t.date :date
      t.time :start
      t.time :finish

      t.timestamps null: false
    end
  end
end
