require 'test_helper'

class TrailersControllerTest < ActionController::TestCase
  setup do
    @trailer = trailers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trailers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trailer" do
    assert_difference('Trailer.count') do
      post :create, trailer: { added_by: @trailer.added_by, bol_nbr: @trailer.bol_nbr, carrier_name: @trailer.carrier_name, changed_by: @trailer.changed_by, date_shipped: @trailer.date_shipped, driver_name: @trailer.driver_name, purchaseorder_id: @trailer.purchaseorder_id, railcar_nbr: @trailer.railcar_nbr, time_in: @trailer.time_in, time_out: @trailer.time_out, time_taken_number: @trailer.time_taken_number, trailer_nbr: @trailer.trailer_nbr, weight_lbs: @trailer.weight_lbs, weight_tons: @trailer.weight_tons, worker: @trailer.worker }
    end

    assert_redirected_to trailer_path(assigns(:trailer))
  end

  test "should show trailer" do
    get :show, id: @trailer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trailer
    assert_response :success
  end

  test "should update trailer" do
    patch :update, id: @trailer, trailer: { added_by: @trailer.added_by, bol_nbr: @trailer.bol_nbr, carrier_name: @trailer.carrier_name, changed_by: @trailer.changed_by, date_shipped: @trailer.date_shipped, driver_name: @trailer.driver_name, purchaseorder_id: @trailer.purchaseorder_id, railcar_nbr: @trailer.railcar_nbr, time_in: @trailer.time_in, time_out: @trailer.time_out, time_taken_number: @trailer.time_taken_number, trailer_nbr: @trailer.trailer_nbr, weight_lbs: @trailer.weight_lbs, weight_tons: @trailer.weight_tons, worker: @trailer.worker }
    assert_redirected_to trailer_path(assigns(:trailer))
  end

  test "should destroy trailer" do
    assert_difference('Trailer.count', -1) do
      delete :destroy, id: @trailer
    end

    assert_redirected_to trailers_path
  end
end
