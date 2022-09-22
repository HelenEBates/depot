require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = FactoryBot.create(:user)
  end
  test "Should prompt for login" do
    get login_url
    assert_response :success
  end

  test "User should be able to login and log out" do
    # User can log in.
    post login_url, params: { name: @user.name, password: 'secret' }

    assert_equal @user.id, session[:user_id]
    assert_redirected_to admin_url

    # User can log out
    delete logout_url

    assert_nil session[:user_id]
    assert_redirected_to store_index_url
  end

  test "Should fail login" do
    post login_url, params: { name: @user.name, password: 'wrong' }

    assert_redirected_to login_url
  end
end
