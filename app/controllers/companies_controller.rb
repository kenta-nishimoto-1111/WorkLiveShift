class CompaniesController < ApplicationController
  impressionist actions: [:show]

  def top; end

  def index
    @company = Company.all
  end

  def show
    @company = Company.find(params[:id])
    impressionist(@company, nil, unique: [:session_hash])
  end
end
