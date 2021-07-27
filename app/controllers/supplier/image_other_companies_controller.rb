class Supplier::ImageOtherCompaniesController < ApplicationController

  def new
    @image = ImageOtherCompany.new
  end

  def create
    @image = ImageOtherCompany.new(image_other_company_params)
    if @image.save
      redirect_to company_details_supplier_company_path(current_supplier)
    else
      render 'new'
    end
  end

  private
  def image_other_company_params
    params.require(:image_other_company).permit(:image_other_company).merge(supplier_id: current_supplier.id)
  end
end
