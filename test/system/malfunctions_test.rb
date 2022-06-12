require "application_system_test_case"

class MalfunctionsTest < ApplicationSystemTestCase
  setup do
    @malfunction = malfunctions(:one)
  end

  test "visiting the index" do
    visit malfunctions_url
    assert_selector "h1", text: "Malfunctions"
  end

  test "should create malfunction" do
    visit malfunctions_url
    click_on "New malfunction"

    fill_in "Comment", with: @malfunction.comment
    fill_in "Date", with: @malfunction.date
    fill_in "Malfunction", with: @malfunction.malfunction_id
    fill_in "Time from", with: @malfunction.time_from
    fill_in "Time to", with: @malfunction.time_to
    fill_in "Track", with: @malfunction.track_id
    click_on "Create Malfunction"

    assert_text "Malfunction was successfully created"
    click_on "Back"
  end

  test "should update Malfunction" do
    visit malfunction_url(@malfunction)
    click_on "Edit this malfunction", match: :first

    fill_in "Comment", with: @malfunction.comment
    fill_in "Date", with: @malfunction.date
    fill_in "Malfunction", with: @malfunction.malfunction_id
    fill_in "Time from", with: @malfunction.time_from
    fill_in "Time to", with: @malfunction.time_to
    fill_in "Track", with: @malfunction.track_id
    click_on "Update Malfunction"

    assert_text "Malfunction was successfully updated"
    click_on "Back"
  end

  test "should destroy Malfunction" do
    visit malfunction_url(@malfunction)
    click_on "Destroy this malfunction", match: :first

    assert_text "Malfunction was successfully destroyed"
  end
end
