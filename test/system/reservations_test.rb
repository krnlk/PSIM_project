require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "should create reservation" do
    visit reservations_url
    click_on "New reservation"

    fill_in "Client", with: @reservation.client_id
    fill_in "Date", with: @reservation.date
    fill_in "Price", with: @reservation.price_id
    fill_in "Reservation", with: @reservation.reservation_id
    fill_in "Shoes", with: @reservation.shoes_id
    fill_in "Time from", with: @reservation.time_from
    fill_in "Time to", with: @reservation.time_to
    fill_in "Track", with: @reservation.track_id
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "should update Reservation" do
    visit reservation_url(@reservation)
    click_on "Edit this reservation", match: :first

    fill_in "Client", with: @reservation.client_id
    fill_in "Date", with: @reservation.date
    fill_in "Price", with: @reservation.price_id
    fill_in "Reservation", with: @reservation.reservation_id
    fill_in "Shoes", with: @reservation.shoes_id
    fill_in "Time from", with: @reservation.time_from
    fill_in "Time to", with: @reservation.time_to
    fill_in "Track", with: @reservation.track_id
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "should destroy Reservation" do
    visit reservation_url(@reservation)
    click_on "Destroy this reservation", match: :first

    assert_text "Reservation was successfully destroyed"
  end
end
