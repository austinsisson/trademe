class UserWorkplace < ActiveRecord::Base
  belongs_to :user
  belongs_to :workplace
  delegate :name, to: :workplace
  delegate :email, to: :user
  
  def pending?
    pending == true
  end
end
