FactoryGirl.define do
  factory :article do
    title { Faker::Name.title }
    text { Faker::Lorem.paragraph }
    category { Article::CATEGORY[rand(2)] }
    user { create(:user) }
  end
end