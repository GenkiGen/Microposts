FactoryBot.define do
  factory :post do
    title { "MyString" }
    content { "MyText" }
    association :user
  end
end
