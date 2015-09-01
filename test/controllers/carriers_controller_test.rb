require 'test_helper'

class CarriersControllerTest < ActionController::TestCase
  setup do
    @carrier = carriers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carriers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carrier" do
    assert_difference('Carrier.count') do
      post :create, carrier: { added_by: @carrier.added_by, address_line_1: @carrier.address_line_1, address_line_2: @carrier.address_line_2, carrier_name: @carrier.carrier_name, changed_by: @carrier.changed_by, city_name: @carrier.city_name, comments: @carrier.comments, contact_name1: @carrier.contact_name1, contact_name2: @carrier.contact_name2, email1: @carrier.email1, email2: @carrier.email2, phone_nbr1: @carrier.phone_nbr1, phone_nbr2: @carrier.phone_nbr2, state_code: @carrier.state_code, zip_code: @carrier.zip_code }
    end

    assert_redirected_to carrier_path(assigns(:carrier))
  end

  test "should show carrier" do
    get :show, id: @carrier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carrier
    assert_response :success
  end

  test "should update carrier" do
    patch :update, id: @carrier, carrier: { added_by: @carrier.added_by, address_line_1: @carrier.address_line_1, address_line_2: @carrier.address_line_2, carrier_name: @carrier.carrier_name, changed_by: @carrier.changed_by, city_name: @carrier.city_name, comments: @carrier.comments, contact_name1: @carrier.contact_name1, contact_name2: @carrier.contact_name2, email1: @carrier.email1, email2: @carrier.email2, phone_nbr1: @carrier.phone_nbr1, phone_nbr2: @carrier.phone_nbr2, state_code: @carrier.state_code, zip_code: @carrier.zip_code }
    assert_redirected_to carrier_path(assigns(:carrier))
  end

  test "should destroy carrier" do
    assert_difference('Carrier.count', -1) do
      delete :destroy, id: @carrier
    end

    assert_redirected_to carriers_path
  end
end
