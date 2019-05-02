class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    render 'users/profile.html.erb'
  end
end
