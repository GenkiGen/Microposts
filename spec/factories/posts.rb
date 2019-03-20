FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    content { Faker::ChuckNorris.fact }
    association :user
  end
end
