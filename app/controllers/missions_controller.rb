class MissionsController < ApplicationController
  def  index
    @missions = Mission.all
  end

  def new
    @mission = Mission.new
  end

  def show
    @mission = Mission.find(params[:id])
  end

  def create
    @mission = Mission.new(mission_params)
    if @mission.save
      redirect_to missions_path
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    if @mission.update(mission_params)
      redirect_to missions_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @mission = Mission.find(params[:id])
    @mission.destroy
    flash[:alert] = "Mission deleted"
    redirect_to missions_path
  end
  private

  def mission_params
    params.require(:mission).permit(:title, :content)
  end
end
