FactoryBot.define do
  factory :supplier do
    company_name { 'test' }
    sequence(:email) { |n| "test_user_email_#{n}@example.com" }
    password { 'test1111' }
    after(:build) do |supplier|
      supplier.company_image.attach(io: File.open(Rails.root.join('app/assets/images', 'test.jpg')), filename: 'test.jpg')
    end
  end
end