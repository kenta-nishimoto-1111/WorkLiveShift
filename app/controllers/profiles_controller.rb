class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_profile, only:[:edit , :update]
  before_action :move_to_index, only:[ :edit, :update]

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
  end

  def update
    if @profile.update(profile_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

 private

  def profile_params
    params.require(:profile).permit(:age, :birth_date, :prefecture_id, :strong_point,:dream).merge(user_id: current_user.id)
  end

  def set_profile
    @profile = Profile.find(params[:id])
    end
  
    def move_to_index
      return redirect_to root_path if current_user.id != @profile.user.id
    end
end
