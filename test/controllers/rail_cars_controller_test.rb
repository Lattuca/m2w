require 'test_helper'

class RailCarsControllerTest < ActionController::TestCase
  setup do
    @rail_car = rail_cars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rail_cars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rail_car" do
    assert_difference('RailCar.count') do
      post :create, rail_car: { actual_dep_dt: @rail_car.actual_dep_dt, added_by: @rail_car.added_by, arrival_dt_400_line: @rail_car.arrival_dt_400_line, arrival_dt_elk_city: @rail_car.arrival_dt_elk_city, arrival_dt_onsite: @rail_car.arrival_dt_onsite, bol_arrival_dt: @rail_car.bol_arrival_dt, bol_nbr: @rail_car.bol_nbr, car_empty: @rail_car.car_empty, changed_by: @rail_car.changed_by, email_bol: @rail_car.email_bol, purchaseorder_id: @rail_car.purchaseorder_id, railcar_nbr: @rail_car.railcar_nbr, sand_grade: @rail_car.sand_grade, vendor_id: @rail_car.vendor_id, vendor_po_nbr: @rail_car.vendor_po_nbr, wgt_at_origin: @rail_car.wgt_at_origin, wgt_on_arrival: @rail_car.wgt_on_arrival }
    end

    assert_redirected_to rail_car_path(assigns(:rail_car))
  end

  test "should show rail_car" do
    get :show, id: @rail_car
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rail_car
    assert_response :success
  end

  test "should update rail_car" do
    patch :update, id: @rail_car, rail_car: { actual_dep_dt: @rail_car.actual_dep_dt, added_by: @rail_car.added_by, arrival_dt_400_line: @rail_car.arrival_dt_400_line, arrival_dt_elk_city: @rail_car.arrival_dt_elk_city, arrival_dt_onsite: @rail_car.arrival_dt_onsite, bol_arrival_dt: @rail_car.bol_arrival_dt, bol_nbr: @rail_car.bol_nbr, car_empty: @rail_car.car_empty, changed_by: @rail_car.changed_by, email_bol: @rail_car.email_bol, purchaseorder_id: @rail_car.purchaseorder_id, railcar_nbr: @rail_car.railcar_nbr, sand_grade: @rail_car.sand_grade, vendor_id: @rail_car.vendor_id, vendor_po_nbr: @rail_car.vendor_po_nbr, wgt_at_origin: @rail_car.wgt_at_origin, wgt_on_arrival: @rail_car.wgt_on_arrival }
    assert_redirected_to rail_car_path(assigns(:rail_car))
  end

  test "should destroy rail_car" do
    assert_difference('RailCar.count', -1) do
      delete :destroy, id: @rail_car
    end

    assert_redirected_to rail_cars_path
  end
end
