class CompanyNamesController < ApplicationController
  def new
    @company_name = CompanyName.new
  end

  def create
    @company_name = CompanyName.new(company_name_params)
    if @company_name.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

 private

  def company_name_params
    params.require(:company_name).permit(:name, :position, :period_start, :period_end, :business_content).merge(user_id: current_user.id)
  end

end
