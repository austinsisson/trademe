class RequestTrade
  
  def self.call(user, coworker, user_shift, coworker_shift)
    ShiftMailer.trade_requested(user, coworker, user_shift, coworker_shift).deliver
  end
end