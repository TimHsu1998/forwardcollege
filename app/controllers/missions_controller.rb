class MissionsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :destroy]
  impressionist :actions=>[:show]
  def  index
    if params[:category].blank?
      @missions = Mission.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
      @categories = Category.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @category = Category.find_by(name: params[:category])
      @missions = Mission.where(:category_id => @category_id).paginate(:page => params[:page], :per_page => 20)
    end
  end

  def new
    @mission = Mission.new
    @categories = Category.all
    @photo = @mission.photos.build
  end

  def show
    @mission = Mission.find(params[:id])
    @comments = @mission.comments.order("created_at DESC")
    @photos = @mission.photos.all
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.user = current_user
    @categories = Category.all
    if @mission.save
      if params[:photos] != nil
        params[:photos]['image'].each do |a|
          @photo = @mission.photos.create(:image => a)
        end
      end
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

    if params[:photos] != nil
      @mission.photos.destroy_all
      params[:photos]['image'].each do |a|
        @picture = @mission.photos.create(:image => a)
      end
      @mission.update(mission_params)
      redirect_to missions_path

    elsif @mission.update(mission_params)
      redirect_to account_missions_path
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
    redirect_to account_missions_path
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :content, :reflection, :finishdate, :image, :category_id, :category)
  end
end
