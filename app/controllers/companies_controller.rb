class CompaniesController < ApplicationController

  def top
  end

  def index
    @company = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end
  
  def first_step
    @company = Company.new
  end
  
  def second_step
    session[:my_company_name] = company_params[:my_company_name]
    session[:company_image] =  params[:company]['company_image']
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
      my_company_name: session[:my_company_name],
      company_image: session[:company_image],
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
      my_company_name: session[:my_company_name],
      company_image: session[:company_image],
      prefecture_id: session[:prefecture_id],
      founding_date: "#{session['founding_date(1i)']}-#{session['founding_date(2i)']}-#{session['founding_date(3i)']}",
      phone_number: session[:phone_number], 
      company_url: session[:company_url], 
      company_content: session[:company_content], 
      company_purpose: session[:company_purpose], 
      company_environment: session[:company_environment], 
      ingredients: session[:ingredients]
    )
    if @company.save
      redirect_to root_path
    else
      render 'sixth_step'
    end
  end

  private
  
  def company_params
    params.require(:company).permit(
      :my_company_name,
      :company_image,
      :prefecture_id,
      :founding_date,
      :phone_number,
      :company_url,
      :company_content,
      :company_purpose,
      :company_environment,
      ingredients:[],
    )
  end

end