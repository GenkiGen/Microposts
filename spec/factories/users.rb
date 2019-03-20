FactoryBot.define do
  factory :user do
    username "John Cena"
    password "Rm!t201278"
    password_confirmation "Rm!t201278"
    sequence(:email) { |n| "useremail#{n}@email.com" }
  end
end