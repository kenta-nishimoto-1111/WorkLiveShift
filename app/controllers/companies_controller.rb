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

    # binding.pry

    # if @company_keyword.present?
    #   @companies = @company_keyword
    # elsif @company_area.present?
    #   @companies = @company_area
    # end

    # @companies = @companies.page(params[:page]).per(5)
  end
end
