class Supplier::SupplierQuestionAnswersController < ApplicationController
  def new
    @questions = SupplierQuestion.order(:sort_order)
  end

  def create
    @questions = SupplierQuestion.order(:sort_order)
    ActiveRecord::Base.transaction do
      @questions.each do |question|
        question.supplier_question_options.each do |option|
          raise ActiveRecord::Rollback unless params[option.id.to_s].present?

          SupplierQuestionAnswer.create!(supplier_id: current_supplier.id,
                                         supplier_question_id: option.supplier_question_id, personality_type: option.personality_type, point: params[option.id.to_s])
        end
      end
      current_supplier.personality_score = current_supplier.calc_personality_score
      current_supplier.save!
      redirect_to company_details_supplier_company_path(current_supplier.id)
    rescue StandardError
      render :new
    end
  end
end

# current_supplier.personality_score = current_supplier.calc_personality_score
# current_supplier.save!
