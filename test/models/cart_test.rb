require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :carts
  fixtures :line_items
  fixtures :products

  test "total_price calculates the total price of all line_items in the cart" do
    assert_in_delta 85.99, carts(:two).total_price
  end

  test "add_products returns a line_item instance" do
    assert_instance_of LineItem, carts(:one).add_product(products(:docker))
  end

  test "add_product returns quantity of 2 when line_item with that procuct id already exists" do
    # line_item fixture with product Ruby is present with a quanity of 1.
    line_item = carts(:one).add_product(products(:ruby))
    assert_equal 2, line_item.quantity
  end

  test "add_product builds a line item when one does not already exist in the cart with the same product id" do
    # line_item fixture with product Rails does not exist.
    line_item = carts(:one).add_product(products(:rails))
    assert_equal 1, line_item.quantity
  end

end
