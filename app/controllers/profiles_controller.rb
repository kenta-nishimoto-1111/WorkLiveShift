class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :set_profile, only: %i[edit update]
  before_action :move_to_index, only: %i[edit update]
  before_action :move_to_edit, only: %i[new create]

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

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:birth_date, :prefecture_id, :strong_point, :dream).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def move_to_index
    return redirect_to root_path if current_user.id != @profile.user.id
  end

  def move_to_edit
    return redirect_to edit_profile_path(current_user.profile.id) unless current_user.profile.nil?
  end
end
