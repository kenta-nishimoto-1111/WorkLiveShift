class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find(params[:user_id])
  end

  def update
    @profile = Profile.find(params[:user_id])
    if @profile.update
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  private
  def profile_params
  params.require(:profile).permit(:age, :birth_date, :prefecture_id, :strong_point,:dream).merge(user_id: current_user.id)
  end
end
