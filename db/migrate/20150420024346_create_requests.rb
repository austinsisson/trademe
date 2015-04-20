class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.integer :coworker_id
      t.integer :user_shift
      t.integer :coworker_shift

      t.timestamps null: false
    end
  end
end
