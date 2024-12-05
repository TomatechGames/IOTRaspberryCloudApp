require "application_system_test_case"

class PiDataTest < ApplicationSystemTestCase
  setup do
    @pi_datum = pi_data(:one)
  end

  test "visiting the index" do
    visit pi_data_url
    assert_selector "h1", text: "Pi data"
  end

  test "should create pi datum" do
    visit pi_data_url
    click_on "New pi datum"

    fill_in "Color", with: @pi_datum.color
    fill_in "Pressure", with: @pi_datum.pressure
    fill_in "Temperature", with: @pi_datum.temperature
    click_on "Create Pi datum"

    assert_text "Pi datum was successfully created"
    click_on "Back"
  end

  test "should update Pi datum" do
    visit pi_datum_url(@pi_datum)
    click_on "Edit this pi datum", match: :first

    fill_in "Color", with: @pi_datum.color
    fill_in "Pressure", with: @pi_datum.pressure
    fill_in "Temperature", with: @pi_datum.temperature
    click_on "Update Pi datum"

    assert_text "Pi datum was successfully updated"
    click_on "Back"
  end

  test "should destroy Pi datum" do
    visit pi_datum_url(@pi_datum)
    click_on "Destroy this pi datum", match: :first

    assert_text "Pi datum was successfully destroyed"
  end
end
