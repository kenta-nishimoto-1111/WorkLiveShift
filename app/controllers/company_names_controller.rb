class CompanyNamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_company_name, only:[:edit , :update ,:destroy ]
  before_action :move_to_index, only:[:edit, :update, :destroy]

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
  end

  def update
    if @company_name.update(company_name_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @company_name.destroy
    redirect_to user_path(current_user)
  end

 private

  def company_name_params
    params.require(:company_name).permit(:name, :position, :period_start, :period_end, :business_content).merge(user_id: current_user.id)
  end

  def set_company_name
  @company_name = CompanyName.find(params[:id])
  end

  def move_to_index
    return redirect_to root_path if current_user.id != @company_name.user.id
  end

end
