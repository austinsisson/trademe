class RequestsController < ApplicationController
  
  def create
    @user = User.find(params[:user])
    @coworker = User.find(params[:coworker_id])
    @user_shift = Shift.find(params[:user_shift])
    @coworker_shift = Shift.find(params[:coworker_shift])
    
    @request = Request.new(request_params)
    
    @request.update(user: @user, coworker_id: @coworker.id, user_shift: @user_shift.id, coworker_shift: @coworker_shift.id)
    
    if @request.save
      redirect_to user_path(@user)
      flash[:notice] = "#{@coworker.name} has been notified of your shift trade request!"
    else
      redirect_to trade_workplace_shift_path(@coworker_shift)
      flash[:error] = "Oops! An error occurred, please try again!"
    end
  end
  
  private
  
  def request_params
    params.permit(:user_id, :coworker_id, :user_shift, :coworker_shift)
  end
end
