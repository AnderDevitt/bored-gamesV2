FactoryBot.define do
  factory :address do
    street_number { 1 }
    street_name { "MyString" }
    suburb { "MyString" }
    state { "MyString" }
    postcode { "MyString" }
    user { nil }
  end
end
