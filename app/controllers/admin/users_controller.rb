class Admin::UsersController < ApplicationController

  def index
    User.all.each do |user|
      user.update( :progress =>  user.total_progress )
    end
    @users = User.order('progress DESC')
  end
end
