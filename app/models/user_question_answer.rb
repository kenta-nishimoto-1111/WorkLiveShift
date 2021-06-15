class UserQuestionAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :question_option
end
