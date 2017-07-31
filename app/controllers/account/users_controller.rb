class Account::UsersController < ApplicationController
  # 使用者必須登入
  before_action :authenticate_user! , only: [:update, :edit]

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to edit_account_user_path(current_user)
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @missions = @user.missions
  end

private

  def user_params
    params.require(:user).permit(:username, :school, :session, :phone, :selfintro, :image,
    :highschool, :year, :major, :nickname)
  end
end
