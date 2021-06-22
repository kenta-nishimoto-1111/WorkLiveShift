    class UserQuestionAnswersController < ApplicationController

      def choice_questions
        @questions = Question.choice.order(:sort_)
      end

      def label_questions
      end
    
    end

