class UsersController < ApplicationController
  
  def show
    @user = current_user
    @user_workplaces = @user.user_workplaces.all
    @user_shifts = Shift.where(user_name: current_user.name)
  end
  
  def update
  end
end
