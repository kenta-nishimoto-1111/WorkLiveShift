require 'csv'

CSV.foreach('db/question.csv') do |question|
  Question.find_or_create_by(id: question[0], message: question[1], question_type: question[2],
                             personality_type: question[3], sort_order: question[4])
end

CSV.foreach('db/question_options.csv') do |question_options|
  QuestionOption.find_or_create_by(id: question_options[0], question_id: question_options[1],
                                   option_text: question_options[2], personality_type: question_options[3], point: question_options[4], sort_order: question_options[5])
end

20.times do |n|
  supplier = Supplier.find_or_initialize_by(
    company_name: "株式会社#{n + 1}"
  )
  supplier.assign_attributes(
    email: "testaaa#{n + 1}@test.com",
    password: "test1111", 
    password_confirmation: "test1111",
    # company_image: File.open(Rails.root.join('app/assets/images', 'test.jpg'))
  )
  supplier.company_image.attach(io: File.open(Rails.root.join('app/assets/images', 'test.jpg')), filename: 'test.jpg')

  supplier.save!

  company = Company.find_or_initialize_by(
    supplier_id: supplier.id
  )
  company.assign_attributes(
    prefecture_id: "#{n + 2}",
    founding_date: "2000-11-04",
    phone_number: "000000000#{n + 1}", 
    company_url: "https://tenshoku.mynavi.jp/",
    company_content: "あなたの会社の事業内容について書く",
    company_purpose: "あなたの事業の目的について書く",
    company_environment: "チームの文化や働く環境について書く",
    ingredients: %w[法人営業 財務 ITコンサルティング スクール運営・マネジメント イラストレーター],
  )
  company.save!
  # supplier.company_image.attach(io: File.open(Rails.root.join('app/assets/images/test.jpg')),
  #                               filename: 'test.jpg')
end

# 20.times do |n|

# end