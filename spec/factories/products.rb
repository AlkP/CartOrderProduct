FactoryBot.define do
  factory :product do
    sequence(:name) { |n| "Product ##{n}" }
    price Random.rand(1000.00)

    factory :product_invalid do
      name nil
      price nil
    end
  end
end
