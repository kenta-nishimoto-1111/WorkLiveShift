    class UserQuestionAnswersController < ApplicationController

      def choice_questions
        @questions = Question.choice.order(:sort_order)
      end

      def scale_questions
        @questions = Question.scale.order(:sort_order)
      end
    
    end

