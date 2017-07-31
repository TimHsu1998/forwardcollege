class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_is_admin
    if !current_user.admin?
      flash[:alert] = "You have no permission."
      redirect_to root_path
    end
  end

  def check_information
    if current_user.school == nil
      redirect_to edit_account_user_path(current_user), alert: "You have to finish your profile"
    elsif current_user.session == nil
      redirect_to edit_account_user_path(current_user), alert: "You have to finish your profile"
    elsif current_user.phone == nil
      redirect_to edit_account_user_path(current_user), alert: "You have to finish your profile"
    elsif current_user.selfintro == nil
      redirect_to edit_account_user_path(current_user), alert: "You have to finish your profile"
    elsif current_user.highschool == nil
      redirect_to edit_account_user_path(current_user), alert: "You have to finish your profile"
    elsif current_user.year == nil
      redirect_to edit_account_user_path(current_user), alert: "You have to finish your profile"
    elsif current_user.major == nil
      redirect_to edit_account_user_path(current_user), alert: "You have to finish your profile"
    elsif current_user.nickname == nil
      redirect_to edit_account_user_path(current_user), alert: "You have to finish your profile"
    end
  end

	protected

	def configure_permitted_parameters
		added_attrs = [:username, :email, :password, :password_confirmation, :remember_me,
    :school, :session, :phone, :selfintro, :image,
    :highschool, :year, :major, :nickname]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs<<:current_password
	end

end
