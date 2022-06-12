require "application_system_test_case"

class UserDataTest < ApplicationSystemTestCase
  setup do
    @user_datum = user_data(:one)
  end

  test "visiting the index" do
    visit user_data_url
    assert_selector "h1", text: "User data"
  end

  test "should create user datum" do
    visit user_data_url
    click_on "New user datum"

    fill_in "Email", with: @user_datum.email
    fill_in "First name", with: @user_datum.first_name
    fill_in "Last name", with: @user_datum.last_name
    fill_in "Login", with: @user_datum.login
    fill_in "Password", with: @user_datum.password
    fill_in "Personals", with: @user_datum.personals_id
    click_on "Create User datum"

    assert_text "User datum was successfully created"
    click_on "Back"
  end

  test "should update User datum" do
    visit user_datum_url(@user_datum)
    click_on "Edit this user datum", match: :first

    fill_in "Email", with: @user_datum.email
    fill_in "First name", with: @user_datum.first_name
    fill_in "Last name", with: @user_datum.last_name
    fill_in "Login", with: @user_datum.login
    fill_in "Password", with: @user_datum.password
    fill_in "Personals", with: @user_datum.personals_id
    click_on "Update User datum"

    assert_text "User datum was successfully updated"
    click_on "Back"
  end

  test "should destroy User datum" do
    visit user_datum_url(@user_datum)
    click_on "Destroy this user datum", match: :first

    assert_text "User datum was successfully destroyed"
  end
end
