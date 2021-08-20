FactoryBot.define do
  factory :supplier do
    company_name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    after(:build) do |supplier|
      supplier.company_image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end