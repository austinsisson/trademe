class WorkplacesController < ApplicationController
  
  def index
    @workplaces = Workplace.where('name = ? and city = ?', params[:name], params[:city])
  end
  
  def show
  end
  
  def create
  end
  
  def destroy
  end
  
  def update
  end
  
  private
  
  def workplace_params
    params.require(:workplace).permit(:name, :address, :city, :state)
  end
end
