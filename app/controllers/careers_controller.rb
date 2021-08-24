class CareersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_career, only: %i[edit update destroy]
  before_action :move_to_index, only: %i[edit update destroy]
  before_action :move_to_edit, only: %i[new create]

  def new
    @career = Career.new
  end

  def create
    @career = Career.new(careers_params)
    if @career.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @career.update(careers_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @career.destroy
    redirect_to user_path(current_user)
  end

  private

  def careers_params
    params.require(:career).permit(:career_name, :position, :period_start, :period_end,
                                   :business_content).merge(user_id: current_user.id)
  end

  def set_career
    @career = Career.find(params[:id])
  end

  def move_to_index
    return redirect_to root_path if current_user.id != @career.user.id
  end

  def move_to_edit
    return redirect_to edit_career_path(current_user.career) if current_user.career != nil
  end
end
