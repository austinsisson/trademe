class UserWorkplace < ActiveRecord::Base
  belongs_to :user
  belongs_to :workplace
  
  delegate :name, to: :workplace
  delegate :email, to: :user
  
  validates :user, presence: true
  
  def moderator?
    role == 'moderator'
  end
  
  def regular?
    role == 'regular'
  end
  
  def pending?
    pending == true
  end
end
