require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  fixtures :carts
  fixtures :line_items
  test "Cart is not rendered when it does not contain line_items" do
    # The partial is not rendered as the first argument of render_if returns false.

    # create a cart with no line_items
    @empty_cart = carts(:three)

    assert_equal @empty_cart.line_items.any?, false
    assert_equal @empty_cart.present?, true
    condition = @empty_cart && @empty_cart.line_items.any?
    record = @empty_cart

    assert_nil render_if(condition, record)
  end

  test "Cart is rendered when it contains line_items" do
    # check that the output of the helper method matches what you'd expect.
    @cart = carts(:one)

    assert_equal @cart.line_items.any?, true
    render_if((@cart), (@cart))
    assert_select 'h2', text: 'Your Cart', count: 1
  end
end
