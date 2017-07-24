class MissionsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :destroy]
  #before_action :require_is_admin, only: [:edit, :destroy]
  def  index
    @missions = Mission.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  def new
    @mission = Mission.new
  end

  def show
    @mission = Mission.find(params[:id])
    @comments = @mission.comments.order("created_at DESC")
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    if @mission.save
      redirect_to missions_path
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:id])
    if current_user != @mission.user && current_user.admin? == false
      redirect_to missions_path, alert: "You have no permission."
    end
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

    if current_user != @mission.user && current_user.admin? == false
      redirect_to missions_path, alert: "You have no permission."
    end

    @mission.destroy
    flash[:alert] = "Mission deleted"
    redirect_to missions_path
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :content, :image)
  end
end
