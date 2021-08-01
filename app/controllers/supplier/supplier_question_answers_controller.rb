class Supplier::SupplierQuestionAnswersController < ApplicationController
  def new
    @questions = SupplierQuestion.order(:sort_order)
  end

end
