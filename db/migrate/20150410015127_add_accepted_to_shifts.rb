class AddAcceptedToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :accepted, :boolean, default: false
  end
end
