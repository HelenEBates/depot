require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  setup do
    @product = FactoryBot.create(:product)
    @order = FactoryBot.create(:order)
    # cart will have been destroyed by this point in Orders#Create
    @line_item = FactoryBot.create(:line_item, cart_id: nil, product_id: @product.id, order_id: @order.id)
  end

  test "An email is created but not sent after a User Order has been saved" do
    @mail = OrderMailer.received(@order)
    assert_equal "Pragmatic Store Order Confirmation", @mail.subject
    assert_equal [@order.email], @mail.to
    assert_equal ["depot@example.com"], @mail.from
    assert_match "Order Received!", @mail.body.encoded
    assert_match @product.title, @mail.body.encoded
  end

  # This method has not been implemented yet - title will be updated when the method is implemented
  test "shipped" do
    @mail = OrderMailer.shipped(@order)
    assert_equal "Pragmatic Store Order Shipped", @mail.subject
    assert_equal [@order.email], @mail.to
    assert_equal ["depot@example.com"], @mail.from
    assert_match "Pragmatic Order Shipped", @mail.body.encoded
    assert_match @product.title, @mail.body.encoded
  end

end
