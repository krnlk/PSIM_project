require "application_system_test_case"

class PriceListsTest < ApplicationSystemTestCase
  setup do
    @price_list = price_lists(:one)
  end

  test "visiting the index" do
    visit price_lists_url
    assert_selector "h1", text: "Price lists"
  end

  test "should create price list" do
    visit price_lists_url
    click_on "New price list"

    check "Current" if @price_list.current
    fill_in "Item type", with: @price_list.item_type
    fill_in "Price", with: @price_list.price
    fill_in "Price", with: @price_list.price_id
    fill_in "Time from", with: @price_list.time_from
    fill_in "Time to", with: @price_list.time_to
    fill_in "Weekday", with: @price_list.weekday
    click_on "Create Price list"

    assert_text "Price list was successfully created"
    click_on "Back"
  end

  test "should update Price list" do
    visit price_list_url(@price_list)
    click_on "Edit this price list", match: :first

    check "Current" if @price_list.current
    fill_in "Item type", with: @price_list.item_type
    fill_in "Price", with: @price_list.price
    fill_in "Price", with: @price_list.price_id
    fill_in "Time from", with: @price_list.time_from
    fill_in "Time to", with: @price_list.time_to
    fill_in "Weekday", with: @price_list.weekday
    click_on "Update Price list"

    assert_text "Price list was successfully updated"
    click_on "Back"
  end

  test "should destroy Price list" do
    visit price_list_url(@price_list)
    click_on "Destroy this price list", match: :first

    assert_text "Price list was successfully destroyed"
  end
end
