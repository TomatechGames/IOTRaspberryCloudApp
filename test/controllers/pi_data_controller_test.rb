require "test_helper"

class PiDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pi_datum = pi_data(:one)
  end

  test "should get index" do
    get pi_data_url
    assert_response :success
  end

  test "should get new" do
    get new_pi_datum_url
    assert_response :success
  end

  test "should create pi_datum" do
    assert_difference("PiDatum.count") do
      post pi_data_url, params: { pi_datum: { color: @pi_datum.color, pressure: @pi_datum.pressure, temperature: @pi_datum.temperature } }
    end

    assert_redirected_to pi_datum_url(PiDatum.last)
  end

  test "should show pi_datum" do
    get pi_datum_url(@pi_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_pi_datum_url(@pi_datum)
    assert_response :success
  end

  test "should update pi_datum" do
    patch pi_datum_url(@pi_datum), params: { pi_datum: { color: @pi_datum.color, pressure: @pi_datum.pressure, temperature: @pi_datum.temperature } }
    assert_redirected_to pi_datum_url(@pi_datum)
  end

  test "should destroy pi_datum" do
    assert_difference("PiDatum.count", -1) do
      delete pi_datum_url(@pi_datum)
    end

    assert_redirected_to pi_data_url
  end
end
