FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    content { Faker::ChuckNorris.fact }
    association :user

    factory :invalid_post do
      title { nil }
    end

    factory :private_post do
      is_private { true }
    end

    factory :public_post do 
      is_private { false }
    end
  end
end
