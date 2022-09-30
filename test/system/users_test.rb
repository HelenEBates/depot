require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "creating a User" do
    @user = FactoryBot.build(:user)
    visit users_url
    click_on "New User"

    fill_in "Name", with: @user.name
    fill_in "Password", with: 'secret'
    fill_in "Confirm", with: 'secret'
    click_on "Create User"

    assert_text "User #{@user.name} was successfully created"
  end

  test "updating a User" do
    visit users_url

    click_on "Edit", match: :first

    fill_in "Name", with: "Different name"
    fill_in "Password", with: 'secret'
    fill_in "Confirm", with: 'secret'
    click_on "Update User"

    assert_text "User Different name was successfully updated"
  end

  test "destroying a User" do
    @user2 = FactoryBot.create(:user)
    visit users_url

    accept_confirm do
      click_on "Destroy", match: :first
    end
  end

  test "Last user cannot be deleted" do
    visit users_url

    accept_confirm do
      click_on "Destroy", match: :first
    end
    
    assert_text "Can't delete last user"
  end
end
