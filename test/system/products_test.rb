require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = FactoryBot.create(:product)
  end

  test "visiting the index" do
    visit products_url

    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    # There are two links to create a new product on the page, this tests the link at the top of the page
    # as the user is more likley to use one they can see without scrolling.
    @new_product = FactoryBot.build(:product)

    visit products_url
    click_on "New Product", match: :first

    fill_in "Title of book", with: @new_product.title
    fill_in "Book description", with: @new_product.description
    fill_in "Image url", with: @new_product.image_url
    fill_in "Price", with: @new_product.price

    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    fill_in "Title of book", with: @product.title
    fill_in "Book description", with: @product.description
    fill_in "Image url", with: @product.image_url
    fill_in "Price", with: @product.price

    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
