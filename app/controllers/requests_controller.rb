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
  
  def update
    @request = Request.find(params[:id])
    @user_shift = Shift.find(@request.user_shift)
    @coworker_shift = Shift.find(@request.coworker_shift)
    @user_name = @user_shift.user_name
    @coworker_name = @coworker_shift.user_name
    
    @coworker = User.find_by_name(@user_name)
    @user = current_user

    @user_shift.update(user_name: @coworker_name, accepted: true)
    @coworker_shift.update(user_name: @user_name, accepted: true)
    
    if @user_shift.save && @coworker_shift.save
      @request.destroy
      ShiftMailer.trade_accepted(@user, @coworker).deliver
      redirect_to user_path(current_user)
      flash[:notice] = "Shifts traded!"
    else
      redirect_to user_path(current_user)
      flash[:error] = "Oops! An error occurred, please try again!"
    end
  end
  
  private
  
  def request_params
    params.permit(:user_id, :coworker_id, :user_shift, :coworker_shift)
  end
end
