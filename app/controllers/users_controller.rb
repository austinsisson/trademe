class UsersController < ApplicationController
  
  def show
    @user = current_user
    @user_workplaces = @user.user_workplaces.all
    @available_shifts = Shift.where(user_name: current_user.name, accepted: false)
    @accepted_shifts = Shift.where(user_name: current_user.name, accepted: true)
  end
  
  def update
  end
end
