require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  fixtures :line_items
  fixtures :products
  test "total_price calculates the total price of the line_item" do
    assert_in_delta 76.00, line_items(:four).total_price
  end
end
