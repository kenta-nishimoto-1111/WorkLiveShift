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
    impressionist(@company, nil, unique: [:session_hash])
  end

  def search
    if params[:keyword] != ''
      @company_keyword = Company.keyword(params[:keyword])
    else
      params[:area] != 0
      @company_area = Company.area(params[:area])
    end

    # binding.pry

    if @company_keyword.present?
      @company = @company_keyword
    elsif @company_area.present?
      @company = @company_area
    end
  end
end
