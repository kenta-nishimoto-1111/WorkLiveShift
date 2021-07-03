class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
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
