FactoryBot.define do
  factory :cart do
  end
end

def cart_with_line_items(line_items_in_cart: 2)
  FactoryBot.create(:cart) do |cart|
    FactoryBot.create_line_items_in_cart(:line_items, line_items_in_cart, cart: cart)
  end
end
