FactoryBot.define do
  factory :product do
    name { "Product #{Faker::Commerce.product_name}" }
    stock { Faker::Number.between(from: 1, to: 100) }
  end
end
