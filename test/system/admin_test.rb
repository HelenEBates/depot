require "application_system_test_case"

class AdminTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit admin_url
    assert_selector "h1", text: "Welcome"
  end

  test "Users see the number of orders" do
    FactoryBot.create(:order)
    visit admin_url

    assert_selector "p", text: /We have #{Order.count} order/
  end
end
