FactoryBot.define do
  factory :user do
    username                { Faker::Name.name }
    password                { "Rm!t201278" }
    password_confirmation   { "Rm!t201278" }
    sequence(:email) { |n|  "useremail#{n}@email.com" }

    factory :user_with_posts do
      after(:build) do |user|
        3.times do
          user.posts << create(:post)
        end
      end
    end
  end
end