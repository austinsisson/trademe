class UserWorkplacesController < ApplicationController
  
  def create
    @workplace = Workplace.find(params[:workplace_id])
    @user_workplace = UserWorkplace.create(user: current_user, workplace: @workplace, pending: true, role: 'regular')

    @user = current_user
    moderator_id = UserWorkplace.where(workplace: @workplace, role: 'moderator').first.user_id
    @moderator = User.find(moderator_id)
    
    if @user_workplace.save
      UserMailer.join_requested(@moderator, @user, @workplace)
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
    user_id = UserWorkplace.find(params[:id]).user_id
    @user = User.find(user_id)
    
    @workplace_id = UserWorkplace.find(params[:id]).workplace_id
    @workplace = Workplace.find(@workplace_id)
    
    @user_workplace = UserWorkplace.find(params[:id])

    if @user_workplace.destroy!
      UserWorkplaceMailer.join_rejected(@user, @workplace).deliver
      redirect_to workplace_path(@workplace_id)
      flash[:notice] = "Co-worker was denied access and has been notified."
    else
      redirect_to workplace_path(@workplace_id)
      flash[:error] = 'An error occurred, please try again!'
    end
  end
  
  private
  
  def user_workplace_params
    params.require(:user_workplace).permit(:workplace, :user, :pending, :role)
  end
end