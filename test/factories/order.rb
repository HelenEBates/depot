FactoryBot.define do
  factory :order do
    address { "123 Street" }
    email { "jane.doe@gmail.com" }
    name { "Jane Doe" }
    pay_type { "Credit card" }
  end
end
