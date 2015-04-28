class UsersController < ApplicationController
  
  def show
    @user = current_user
    @user_workplaces = @user.user_workplaces.all
    @available_shifts = Shift.where(user_name: current_user.name, accepted: false)
    @accepted_shifts = Shift.where(user_name: current_user.name, accepted: true)
    @user_requests = Request.where(user_id: current_user.id, accepted: false)
    @coworker_requests = Request.where(coworker_id: current_user.id, accepted: false)
  end
  
  def update
  end
end
