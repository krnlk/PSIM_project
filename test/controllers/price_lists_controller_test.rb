require "test_helper"

class PriceListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @price_list = price_lists(:one)
  end

  test "should get index" do
    get price_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_price_list_url
    assert_response :success
  end

  test "should create price_list" do
    assert_difference("PriceList.count") do
      post price_lists_url, params: { price_list: { current: @price_list.current, item_type: @price_list.item_type, price: @price_list.price, price_id: @price_list.price_id, time_from: @price_list.time_from, time_to: @price_list.time_to, weekday: @price_list.weekday } }
    end

    assert_redirected_to price_list_url(PriceList.last)
  end

  test "should show price_list" do
    get price_list_url(@price_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_price_list_url(@price_list)
    assert_response :success
  end

  test "should update price_list" do
    patch price_list_url(@price_list), params: { price_list: { current: @price_list.current, item_type: @price_list.item_type, price: @price_list.price, price_id: @price_list.price_id, time_from: @price_list.time_from, time_to: @price_list.time_to, weekday: @price_list.weekday } }
    assert_redirected_to price_list_url(@price_list)
  end

  test "should destroy price_list" do
    assert_difference("PriceList.count", -1) do
      delete price_list_url(@price_list)
    end

    assert_redirected_to price_lists_url
  end
end
