FactoryBot.define do
  factory :purchase do
    price { 1.5 }
    deliver { false }
    game { nil }
    user { nil }
  end
end
