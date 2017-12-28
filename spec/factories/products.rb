FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Продукт ##{n}" }
    price rand(1000.00)
  end
end
