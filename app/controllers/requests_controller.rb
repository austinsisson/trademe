class RequestsController < ApplicationController
  
  
  private
  
  def request_params
    params.require(:request).permit(:user, :coworker, :user_shift, :coworker_shift)
  end
end
