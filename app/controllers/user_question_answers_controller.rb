class UserQuestionAnswersController < ApplicationController

  def first_question
    @a = current_user.user_question_answers.joins(:question).order('questions.sort_order')
  end
 
end

