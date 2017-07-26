class MissionsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :destroy]
  def  index
    if params[:category].blank?
      @missions = Mission.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
      @categories = Category.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @missions = Mission.where(:category_id => @category_id).paginate(:page => params[:page], :per_page => 20)
    end
  end

  def new
    @mission = Mission.new
    @categories = Category.all
  end

  def show
    @mission = Mission.find(params[:id])
    @comments = @mission.comments.order("created_at DESC")
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    @categories = Category.all
    if @mission.save
      redirect_to missions_path
    else
      render :new
    end
  end

  def edit
    @mission = Mission.find(params[:id])
    @categories = Category.all
    if current_user != @mission.user && current_user.admin? == false
      redirect_to missions_path, alert: "You have no permission."
    end
  end

  def update
    @mission = Mission.find(params[:id])
    @categories = Category.all
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
    params.require(:mission).permit(:title, :content, :image, :category_id, :category)
  end
end
