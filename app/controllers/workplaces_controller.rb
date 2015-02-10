class WorkplacesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  
  def index
    @workplaces = Workplace.fuzzy_search(name: params[:name], city: params[:city])
  end
  
  def show
    @workplace = Workplace.find(params[:id])
  end
  
  def new
    @workplace = Workplace.new
  end
  
  def create
    @workplace = Workplace.create(workplace_params)
    
    if @workplace.save
      redirect_to workplace_path(@workplace)
      flash[:notice] = 'Workplace added!'
    else
      redirect_to new_workplace_path
      flash[:error] = @workplace.errors[:name].first
    end
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
