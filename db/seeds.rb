require "csv"
 
CSV.foreach('db/question.csv') do |question|
  Question.create(:id => question[0], :message => question[1], :question_type => question[2], :personality_type => question[3], :sort_order => question[4])
end

CSV.foreach('db/question_options.csv') do |question_options|
  QuestionOption.create(:id => question_options[0], :question_id => question_options[1], :option_text => question_options[2], :personality_type => question_options[3], :point => question_options[4], :sort_order => question_options[5])
end