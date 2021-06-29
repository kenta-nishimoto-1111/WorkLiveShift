class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @career = @user.career
    answers = current_user.user_question_answers
    @total = {"hamo"=>0, "pasi"=>0, "revel"=>0, "thinker"=>0, "ima"=>0, "pro"=>0}
    answers.each do |answer|
      @total[answer.personality_type] += answer.point  
    end

    if @profile.present?
        @birthday = @profile.birth_date
        date_format = "%Y%m%d"
        birthday = @birthday.to_date
        @age = (Date.today.strftime(date_format).to_i - birthday.strftime(date_format).to_i) / 10000
    end
  end
end
