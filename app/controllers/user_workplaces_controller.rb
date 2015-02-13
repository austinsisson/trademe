class UserWorkplacesController < ApplicationController
  
  def create
    @workplace = Workplace.find(params[:workplace_id])
    @user_workplace = UserWorkplace.create(user: current_user, workplace: @workplace, pending: true)
    
    if @user_workplace.save
      redirect_to workplace_path(@workplace)
      flash[:notice] = "Your request to join #{@workplace.name} has been submitted."
    else
      redirect_to workplaces_path
      flash[:error] = 'An error occurred, please try again!'
    end
  end
end