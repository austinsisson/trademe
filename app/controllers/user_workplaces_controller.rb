class UserWorkplacesController < ApplicationController
  
  def create
    @workplace = Workplace.find(params[:workplace_id])
    @user_workplace = UserWorkplace.create(user: current_user, workplace: @workplace, pending: true, role: 'regular')
    
    if @user_workplace.save
      redirect_to workplace_path(@workplace)
      flash[:notice] = "Your request to join #{@workplace.name} has been submitted."
    else
      redirect_to workplace_path
      flash[:error] = 'An error occurred, please try again!'
    end
  end
  
  def update
    @workplace = UserWorkplace.find(params[:id]).workplace_id
    @user_workplace = UserWorkplace.find(params[:id])
        
    if @user_workplace.update!(user_workplace_params)
      redirect_to workplace_path(@workplace)
      flash[:notice] = "Success!"
    else
      redirect_to workplace_path(@workplace)
      flash[:error] = 'An error occurred, please try again!'
    end
  end
  
  def destroy
    @workplace = UserWorkplace.find(params[:id]).workplace_id
    @user_workplace = UserWorkplace.find(params[:id])

    if @user_workplace.destroy!
      redirect_to workplace_path(@workplace)
      flash[:notice] = "Co-Worker was denied access"
    else
      redirect_to workplace_path(@workplace)
      flash[:error] = 'An error occurred, please try again!'
    end
  end
  
  private
  
  def user_workplace_params
    params.require(:user_workplace).permit(:workplace, :user, :pending, :role)
  end
end