class UserWorkplaceMailer < ApplicationMailer
  
  def join_rejected(user, workplace)
    @user = user
    @workplace = workplace
    mail(to: @user.email, subject: 'Join Rejected')
  end
end
