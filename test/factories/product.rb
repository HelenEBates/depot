FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "product-title-#{n}" }
    description { "Ruby is the fastest growing and most exciting dynamic language out there." }
    image_url { "ruby.jpg" }
    price { 49.50 }
  end
end
