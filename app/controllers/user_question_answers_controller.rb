class UserQuestionAnswersController < ApplicationController

    def choice_questions
      @questions = Question.choice.order(:sort_order)
    end

    def scale_questions
      @questions = Question.scale.order(:sort_order)
    end


    def thinker
    end

    def pasi
    end

    def hamo
    end

    def ima
    end

    def revel
    end

    def pro
    end
end

