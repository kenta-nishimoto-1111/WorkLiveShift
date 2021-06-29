class UserQuestionAnswersController < ApplicationController

    def choice_questions
      @questions = Question.choice.order(:sort_order)
    end

    def answer_choice_questions
      questions = Question.choice.order(:sort_order)
      questions.each do |question|
        option_id = params[question.id.to_s]
        question_option = QuestionOption.find(option_id)
        answer = current_user.user_question_answers.find_or_initialize_by(question_id: question.id)
        answer.question_option_id = question_option.id
        answer.personality_type = question_option.personality_type
        answer.point = question_option.point
        answer.save!
      end
      redirect_to scale_questions_user_question_answers_path
    end


    def scale_questions
      @questions = Question.scale.order(:sort_order)
    end

    def scale_choice_questions
      questions = Question.scale.order(:sort_order)
      questions.each do |question|
        point = params[question.id.to_s].to_i
        answer = current_user.user_question_answers.find_or_initialize_by(question_id: question.id)
        answer.personality_type = question.personality_type
        answer.point = point
        answer.save!
      end
      redirect_to user_question_answer_path(current_user)
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


