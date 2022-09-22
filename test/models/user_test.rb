require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "User must have a name" do
    user = FactoryBot.build(:user, name: nil)
    assert user.invalid?
    assert_equal ["can't be blank"], user.errors[:name]
  end

  test "User name must be unique" do
    user = FactoryBot.create(:user, name: "Grizzly Bear")
    user1 = FactoryBot.build(:user, name: "Grizzly Bear")
    assert user1.invalid?
    assert_equal ["has already been taken"], user1.errors[:name]
  end

  test "User must have a password" do
    user = FactoryBot.build(:user, password: nil)
    assert user.invalid?
    assert_equal ["can't be blank"], user.errors[:password]
  end
end
