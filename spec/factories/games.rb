FactoryBot.define do
  factory :game do
    name { "MyString" }
    genre { 1 }
    minimum_players { 1 }
    maximum_players { 1 }
    price { 1.5 }
    description { "MyText" }
    user { nil }
  end
end
