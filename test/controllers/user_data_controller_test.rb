require "test_helper"

class UserDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_datum = user_data(:one)
  end

  test "should get index" do
    get user_data_url
    assert_response :success
  end

  test "should get new" do
    get new_user_datum_url
    assert_response :success
  end

  test "should create user_datum" do
    assert_difference("UserDatum.count") do
      post user_data_url, params: { user_datum: { email: @user_datum.email, first_name: @user_datum.first_name, last_name: @user_datum.last_name, login: @user_datum.login, password: @user_datum.password, personals_id: @user_datum.personals_id } }
    end

    assert_redirected_to user_datum_url(UserDatum.last)
  end

  test "should show user_datum" do
    get user_datum_url(@user_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_datum_url(@user_datum)
    assert_response :success
  end

  test "should update user_datum" do
    patch user_datum_url(@user_datum), params: { user_datum: { email: @user_datum.email, first_name: @user_datum.first_name, last_name: @user_datum.last_name, login: @user_datum.login, password: @user_datum.password, personals_id: @user_datum.personals_id } }
    assert_redirected_to user_datum_url(@user_datum)
  end

  test "should destroy user_datum" do
    assert_difference("UserDatum.count", -1) do
      delete user_datum_url(@user_datum)
    end

    assert_redirected_to user_data_url
  end
end
