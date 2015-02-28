class UserWorkplaceMailer < ApplicationMailer
  
  def join_requested(moderators, user, workplace)
    @moderators = moderators.map(&:email)
    @user = user
    @workplace = workplace
    mail(to: @moderators, subject: 'New Co-Worker Request')
  end
  
  def join_rejected(user, workplace)
    @user = user
    @workplace = workplace
    mail(to: @user.email, subject: 'Join Rejected')
  end
end
