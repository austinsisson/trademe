class ShiftsController < ApplicationController
  
  def new
    @workplace = Workplace.find(params[:workplace_id])
    @shift = Shift.new
  end
  
  def create
    @workplace = Workplace.find(params[:workplace_id])
    @shift = Shift.create(shift_params)
    @shift.update(workplace_id: @workplace.id, user_name: current_user.name)
    
    if @shift.save
      redirect_to workplace_path(@workplace)
      flash[:notice] = "Shift posted!"
    else
      flash[:error] = "Oops! An error occurred, please try again!"
    end
  end
  
  def trade
    @coworker_shift = Shift.find(params[:id])
    @workplace = Workplace.find(params[:workplace_id])
    @available_shifts = Shift.where(workplace_id: @workplace, user_name: current_user.name, accepted: false)

    @coworker = User.find_by_name(@coworker_shift.user_name)
    @user = current_user
  end  
  
  def trade_request
    @user = User.find(params[:user])
    @coworker = User.find(params[:coworker])
    @user_shift = Shift.find(params[:user_shift])
    @coworker_shift = Shift.find(params[:coworker_shift])
    
    ShiftMailer.trade_requested(@user, @coworker, @user_shift, @coworker_shift).deliver
    
    if ShiftMailer.trade_requested
      
      redirect_to user_path
      flash[:notice] = "#{@coworker.name} has been notified of your shift trade request!"
    else
      redirect_to trade_workplace_shift_path(@coworker_shift)
      flash[:error] = "Oops! An error occurred, please try again!"
    end
  end
  
  def update
    @shift = Shift.find(params[:id])
    @workplace = Workplace.find(params[:workplace_id])
    @user = User.find_by_name(@shift.user_name)

    
    if @shift.update(shift_params)
      @coworker = User.find_by_name(@shift.user_name)
      ShiftMailer.shift_accepted(@user, @coworker, @shift).deliver
      redirect_to workplace_path(@workplace)
      flash[:notice] = "Shift accepted"
    else
      flash[:error] = "Oops! An error occurred, please try again!"
    end
  end
  
  def destroy
  end
  
  private
  
  def shift_params
    params.require(:shift).permit(:name, :date, :start, :finish, :workplace_id, :user_name, :accepted)
  end
end
