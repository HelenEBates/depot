FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "customer-name-#{n}" }
    password_digest { BCrypt::Password.create('secret', cost: 4) }
  end
end
