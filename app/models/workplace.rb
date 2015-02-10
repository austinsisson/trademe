class Workplace < ActiveRecord::Base
  extend Textacular
  
  validates_presence_of :name, :address, :city, :state, message: 'Oops, looks like you left a box blank!'
  validates_uniqueness_of :name, scope: :address, message: 'This workplace already exists!'
end
