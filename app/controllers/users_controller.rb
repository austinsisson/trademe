class UsersController < ApplicationController
  
  def show
    @user = current_user
    @user_workplaces = @user.user_workplaces.all
  end
  
  def update
  end
end
