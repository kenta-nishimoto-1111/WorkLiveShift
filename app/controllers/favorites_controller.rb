class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: %i[show create destroy]

  def show
    @user = User.find(params[:company_id])
    @favorite = @user.companies
  end

  def create
    favorite = current_user.favorites.build(company_id: params[:company_id])
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Favorite.find_by(company_id: params[:company_id], user_id: current_user.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
