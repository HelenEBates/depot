require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
  end
  test "Should prompt for login" do
    get login_url
    assert_response :success
  end

  test "User sees a flash notice when they log out" do
    delete logout_url

    assert_nil session[:user_id]
    assert_redirected_to store_index_url
    assert_equal "Logged out", flash[:notice]
  end

  test "User sees a flash notice when they have entered incorrect log in detail" \
       "and is redirected to the log in pagd" do
    post login_url, params: { name: @user.name, password: 'wrong' }

    assert_redirected_to login_url
    assert_equal "Invalid user/password combination", flash[:alert]
  end
end
