class UserWorkplace < ActiveRecord::Base
  belongs_to :user
  belongs_to :workplace
  delegate :name, to: :workplace
end
