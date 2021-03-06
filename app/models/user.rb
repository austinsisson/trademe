class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable,
  :omniauthable, omniauth_providers: [:facebook]
  
  has_many :user_workplaces, dependent: :destroy
  has_many :workplaces, through: :user_workplaces
  has_many :shifts
    
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email       = auth.info.email
      user.password    = Devise.friendly_token[0,20]
      user.name        = auth.info.name
      user.skip_confirmation!
    end
  end
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
