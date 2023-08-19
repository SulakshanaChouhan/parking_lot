require "test_helper"

class ParkingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get parkings_index_url
    assert_response :success
  end

  test "should get registration_numbers_by_color" do
    get parkings_registration_numbers_by_color_url
    assert_response :success
  end

  test "should get ticket_number_by_registration_number" do
    get parkings_ticket_number_by_registration_number_url
    assert_response :success
  end

  test "should get ticket_numbers_by_color" do
    get parkings_ticket_numbers_by_color_url
    assert_response :success
  end

  test "should get park_car" do
    get parkings_park_car_url
    assert_response :success
  end

  test "should get remove_car" do
    get parkings_remove_car_url
    assert_response :success
  end
end
