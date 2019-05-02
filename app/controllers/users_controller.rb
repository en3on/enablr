class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @projects = @user.projects.all
    render 'users/profile.html.erb'
  end
end
