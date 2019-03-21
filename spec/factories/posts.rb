FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    content { Faker::ChuckNorris.fact }
    association :user

    factory :invalid_post do
      title { nil }
    end
  end
end
