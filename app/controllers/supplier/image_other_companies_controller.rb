class Supplier::ImageOtherCompaniesController < ApplicationController

  def new
    @image_other_company = ImageOtherCompany.new
  end
end
