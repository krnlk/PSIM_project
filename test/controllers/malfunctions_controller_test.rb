require "test_helper"

class MalfunctionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @malfunction = malfunctions(:one)
  end

  test "should get index" do
    get malfunctions_url
    assert_response :success
  end

  test "should get new" do
    get new_malfunction_url
    assert_response :success
  end

  test "should create malfunction" do
    assert_difference("Malfunction.count") do
      post malfunctions_url, params: { malfunction: { comment: @malfunction.comment, date: @malfunction.date, malfunction_id: @malfunction.malfunction_id, time_from: @malfunction.time_from, time_to: @malfunction.time_to, track_id: @malfunction.track_id } }
    end

    assert_redirected_to malfunction_url(Malfunction.last)
  end

  test "should show malfunction" do
    get malfunction_url(@malfunction)
    assert_response :success
  end

  test "should get edit" do
    get edit_malfunction_url(@malfunction)
    assert_response :success
  end

  test "should update malfunction" do
    patch malfunction_url(@malfunction), params: { malfunction: { comment: @malfunction.comment, date: @malfunction.date, malfunction_id: @malfunction.malfunction_id, time_from: @malfunction.time_from, time_to: @malfunction.time_to, track_id: @malfunction.track_id } }
    assert_redirected_to malfunction_url(@malfunction)
  end

  test "should destroy malfunction" do
    assert_difference("Malfunction.count", -1) do
      delete malfunction_url(@malfunction)
    end

    assert_redirected_to malfunctions_url
  end
end
