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
  
  def update
    @shift = Shift.find(params[:id])
    @workpalce = Workplace.find(params[:workplace_id])
    
    if @shift.update(shift_params)
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
