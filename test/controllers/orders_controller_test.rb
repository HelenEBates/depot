require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  fixtures :orders
  setup do
    # orders fixture left in place for now
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "New order requires an item in cart" do
    get new_order_url

    assert_redirected_to store_index_path
    assert_equal flash[:notice], 'Your cart is empty'
  end

  test "User with an item in their cart should get new" do
    post line_items_url, params: { product_id: products(:ruby).id }

    get new_order_url
    assert_response :success
  end

  test "When the order cannot be saved the user is redirected to the catalog page" do
    assert_no_difference 'Order.count' do
      post orders_url, params: { order: { address: '', email: '', name: '', pay_type: '' } }
    end
  end


  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order:
        {
          address: @order.address,
          email: @order.email,
          name: @order.name,
          pay_type: @order.pay_type
        }
      }
    end

    assert_redirected_to store_index_url(locale: 'en-GB')
    assert_equal I18n.t('.thanks'), flash[:notice]
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { address: @order.address, email: @order.email, name: @order.name, pay_type: @order.pay_type } }
    assert_redirected_to order_url(@order)
    assert_equal "Order was successfully updated.", flash[:notice]
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
    assert_equal "Order was successfully destroyed.", flash[:notice]
  end
end
