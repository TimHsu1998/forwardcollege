class OmniauthCallbacksController < ApplicationController
  def facebook
		@user = User.from_facebook(request.env["omniauth.auth"], current_user)

		if @user.persisted?
			flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      if @user.nickname == nil
        sign_in @user, :event => :authentication
        redirect_to edit_account_user_path(current_user)
      else
        sign_in_and_redirect @user, :event => :authentication
      end
		else
			session["devise.user_data"] = request.env["omniauth.auth"]
			redirect_to new_user_registration_path
		end
	end
end
