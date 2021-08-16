class CompaniesController < ApplicationController
  impressionist actions: [:show]

  def top; end

  def index
    @company_topimage = Company.find(1)
    @company_images = Company.where.not(id: 1)
    @companies = Company.joins(:supplier).order("abs(suppliers.personality_score - #{current_user.personality_score})").page(params[:page]).per(5)
  end

  def show
    @company = Company.find(params[:id])
    @ingredients = JSON.parse(@company.ingredients)
    @other_images = @company.supplier.image_other_companies
    impressionist(@company, nil, unique: [:session_hash])
  end

  def search
    @keyword = params[:keyword]
    @area = params[:area]
    @genre = params[:genre]
    @companies = Company.all
    @companies = @companies.keyword(params[:keyword]) if params[:keyword] != ''
    @companies = @companies.area(params[:area]) if params[:area] != '0'
    @companies = @companies.genre(params[:genre]) if params[:genre] != ''
  end
end
