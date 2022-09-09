require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :carts
  fixtures :line_items
  fixtures :products
  test "total_price calculates the total price of all line_items in the cart" do
    assert_in_delta 85.99, carts(:two).total_price
  end
end
