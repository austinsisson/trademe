class UserWorkplaceMailer < ApplicationMailer
  
  def join_requested(moderator, user, workplace)
    @moderator = moderator.email
    @user = user.name
    @workplace = workplace
    mail(to: @moderator.email, subject: 'New Co-Worker Request')
  end
  
  def join_rejected(user, workplace)
    @user = user
    @workplace = workplace
    mail(to: @user.email, subject: 'Join Rejected')
  end
end
