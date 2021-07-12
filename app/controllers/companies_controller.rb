class CompaniesController < ApplicationController
  def top; end

  def index
    @company = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def first_step; end

  def second_step
    @company = Company.new
  end

  def third_step
    session[:prefecture_id] = company_params[:prefecture_id]
    session['founding_date(1i)'] = params[:company]['founding_date(1i)']
    session['founding_date(2i)'] = params[:company]['founding_date(2i)']
    session['founding_date(3i)'] = params[:company]['founding_date(3i)']
    session[:phone_number] = company_params[:phone_number]
    session[:company_url] = company_params[:company_url]
    @company = Company.new
  end

  def fourth_step
    session[:company_content] = company_params[:company_content]
    @company = Company.new
  end

  def fifth_step
    session[:company_purpose] = company_params[:company_purpose]
    @company = Company.new
  end

  def sixth_step
    session[:company_environment] = company_params[:company_environment]
    @company = Company.new
  end

  def double_check
    session[:ingredients] = company_params[:ingredients]
    @check = Company.new(
      prefecture_id: session[:prefecture_id],
      founding_date: "#{session['founding_date(1i)']}-#{session['founding_date(2i)']}-#{session['founding_date(3i)']}",
      phone_number: session[:phone_number],
      company_url: session[:company_url],
      company_content: session[:company_content],
      company_purpose: session[:company_purpose],
      company_environment: session[:company_environment],
      ingredients: session[:ingredients]
    )
    @company = Company.new
  end

  def create
    @company = Company.new(
      prefecture_id: session[:prefecture_id],
      founding_date: "#{session['founding_date(1i)']}-#{session['founding_date(2i)']}-#{session['founding_date(3i)']}",
      phone_number: session[:phone_number],
      company_url: session[:company_url],
      company_content: session[:company_content],
      company_purpose: session[:company_purpose],
      company_environment: session[:company_environment],
      ingredients: session[:ingredients],
      supplier_id: current_supplier.id
    )
    if @company.save
      redirect_to company_details_company_path(@company.id)
    else
      render 'sixth_step'
    end
  end

  # 企業側のユーザーページ
  def company_details
    @company = Company.find(params[:id])
  end

  private

  def company_params
    params.require(:company).permit(
      :prefecture_id,
      :founding_date,
      :phone_number,
      :company_url,
      :company_content,
      :company_purpose,
      :company_environment,
      ingredients: []
    ).merge(supplier_id: current_supplier.id)
  end
end
