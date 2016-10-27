FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :other_email do
      email { Faker::Internet.email }
    end
  end
end
