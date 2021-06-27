class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @career = @user.career

    @birthday = @profile.birth_date
    date_format = "%Y%m%d"
    birthday = @birthday.to_date
    @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
  end
end
