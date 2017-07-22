class CommentsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @mission = Mission.find(params[:mission_id])
    @comment = Comment.new
  end

  def create
    @mission = Mission.find(params[:mission_id])
    @comment = Comment.new(comment_params)
    @comment.mission = @mission
    @comment.user = current_user

    if @comment.save
      redirect_to mission_path(@mission)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
