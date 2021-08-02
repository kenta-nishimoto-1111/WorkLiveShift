class Supplier::SupplierQuestionAnswersController < ApplicationController
  def new
    @questions = SupplierQuestion.order(:sort_order)
  end

  def create
    @questions = SupplierQuestion.order(:sort_order)
    ActiveRecord::Base.transaction do
      @questions.each do |question|
        question.supplier_question_options.each do |option|
          unless params[option.id.to_s].present?
            raise ActiveRecord::Rollback
          end
          SupplierQuestionAnswer.create!(supplier_id: current_supplier.id, supplier_question_id: option.supplier_question_id, personality_type: option.personality_type, point: params[option.id.to_s])
        end
      end
      redirect_to company_details_supplier_company_path(current_supplier.id)
    rescue
      render :new
    end
  end

end
