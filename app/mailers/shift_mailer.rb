class ShiftMailer < ApplicationMailer
  
  def shift_accepted(user, coworker, shift)
    @user = user
    @coworker = coworker
    @shift = shift
    mail(to: @user.email, subject: "Shift Accepted!")
  end
  
  def trade_requested(user, coworker, user_shift, coworker_shift)
    @coworker = user
    @user = coworker
    @coworker_shift = user_shift
    @user_shift = coworker_shift
    mail(to: @user.email, subject: "Shift Trade Requested!")
  end
  
  def trade_accepted(user, coworker)
    @user = user
    @coworker = coworker
    mail(to: @coworker.email, subject: "Shift Trade Accepted!")
  end
  
  def trade_denied(user, coworker)
  end
end