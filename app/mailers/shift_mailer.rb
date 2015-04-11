class ShiftMailer < ApplicationMailer
  
  def shift_accepted(user, coworker, shift)
    @user = user
    @coworker = coworker
    @shift = shift
    mail(to: @user.email, subject: "Shift Accepted!")
  end
  
  def trade_requested(user, coworker, user_shift, coworker_shift)
    @user = user
    @coworker = coworker
    @user_shift = user_shift
    @coworker_shift = coworker_shift
    mail(to: @user.email, subject: "Shift Trade Requested!")
  end
  
  def trade_accepted
  end
  
  def trade_denied
  end
end