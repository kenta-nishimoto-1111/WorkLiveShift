class CompaniesController < ApplicationController
  impressionist actions: [:show]

  def top; end

  def index
    @company_topimage = Company.find(1)
    @company_images = Company.where.not(id: 1)
    @companies = Company.all.page(params[:page]).per(5)
  end

  def show
    @company = Company.find(params[:id])
    @ingredients = JSON.parse(@company.ingredients)
    impressionist(@company, nil, unique: [:session_hash])
  end

  def search
    @companies = Company.all
    @companies = @companies.keyword(params[:keyword]) if params[:keyword] != ''
    @companies = @companies.area(params[:area]) if params[:area] != 0
    @companies = @ingredients.genre(params[:genre]) if params[:genre] != ''
  end
end
