class Workplace < ActiveRecord::Base
  validates_presence_of :name, :address, :city, :state
  validates_uniqueness_of :name, scope: :address, message: 'This workplace already exists!'
end
