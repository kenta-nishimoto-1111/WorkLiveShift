class Supplier::CompaniesController < ApplicationController
  before_action :authenticate_supplier!, except: %i[first_step]
  before_action :set_company_find, only: %i[edit update company_details]
  before_action :set_company_new, only: %i[second_step third_step fourth_step fifth_step sixth_step double_check]
  before_action :move_to_index, only: %i[company_details edit update]

  def first_step; end

  def second_step; end

  def third_step
    session[:prefecture_id] = company_params[:prefecture_id]
    session['founding_date(1i)'] = params[:company]['founding_date(1i)']
    session['founding_date(2i)'] = params[:company]['founding_date(2i)']
    session['founding_date(3i)'] = params[:company]['founding_date(3i)']
    session[:phone_number] = company_params[:phone_number]
    session[:company_url] = company_params[:company_url]
  end

  def fourth_step
    session[:company_content] = company_params[:company_content]
  end

  def fifth_step
    session[:company_purpose] = company_params[:company_purpose]
  end

  def sixth_step
    session[:company_environment] = company_params[:company_environment]
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
      redirect_to company_details_supplier_company_path(@company.id)
    else
      render 'sixth_step'
    end
  end

  # 企業側のユーザーページ
  def company_details
    @favorites = Favorite.where(company_id: current_supplier.id).count
    @entries = Entry.where(supplier_id: current_supplier.id).count
  end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to company_details_supplier_company_path(@company.id)
    else
      render 'edit'
    end
  end

  def ingredients_update
    
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

  def set_company_new
    @company = Company.new
  end

  def set_company_find
    @company = Company.find(params[:id])
  end

  def move_to_index
    return redirect_to root_path if current_supplier.id != @company.supplier.id
  end
end
