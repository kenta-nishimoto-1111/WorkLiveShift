class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @career = @user.career
  end
end
