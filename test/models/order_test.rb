require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "order validates presence of name" do
    order = FactoryBot.build(:order, name: nil,
                                     address: "123 Street, Bristol",
                                     email: "customer@gmail.com",
                                     pay_type: 1
                                    )
    assert_not order.valid?
  end

  test "order validates presence of address" do
    order = FactoryBot.build(:order, name: "Mrs Customer",
                                     address: nil,
                                     email: "customer@gmail.com",
                                     pay_type: 1
                                    )
    assert_not order.valid?
  end

  test "order validates presence of email" do
    order = FactoryBot.build(:order, name: "Mrs Customer",
                                     address: "123 Street, Bristol",
                                     email: nil,
                                     pay_type: 1
                                    )
    assert_not order.valid?
  end

  test "pay_type attribute must be one of the pay_type keys" do
    order = FactoryBot.build(:order, name: "Mrs Customer",
                                     address: "123 Street, Bristol",
                                     email: "customer@gmail.com",
                                     pay_type: nil
                                    )
    assert_not order.valid?
  end

  test "add_line_items_from_cart transfers line items from the cart to the order" do
    # create a cart with associated line items
    # call add_line_items_from_cart on an order instance
    # assert that Order has associated line_items
  end
end
