require 'test_helper'

class VendorsControllerTest < ActionController::TestCase
  setup do
    @vendor = vendors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor" do
    assert_difference('Vendor.count') do
      post :create, vendor: { added_by: @vendor.added_by, address_line_1: @vendor.address_line_1, address_line_2: @vendor.address_line_2, changed_by: @vendor.changed_by, city_name: @vendor.city_name, comments: @vendor.comments, contact_name1: @vendor.contact_name1, contact_name2: @vendor.contact_name2, email1: @vendor.email1, email2: @vendor.email2, phone_nbr1: @vendor.phone_nbr1, phone_nbr2: @vendor.phone_nbr2, state_code: @vendor.state_code, vendor_name: @vendor.vendor_name, zip_code: @vendor.zip_code }
    end

    assert_redirected_to vendor_path(assigns(:vendor))
  end

  test "should show vendor" do
    get :show, id: @vendor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor
    assert_response :success
  end

  test "should update vendor" do
    patch :update, id: @vendor, vendor: { added_by: @vendor.added_by, address_line_1: @vendor.address_line_1, address_line_2: @vendor.address_line_2, changed_by: @vendor.changed_by, city_name: @vendor.city_name, comments: @vendor.comments, contact_name1: @vendor.contact_name1, contact_name2: @vendor.contact_name2, email1: @vendor.email1, email2: @vendor.email2, phone_nbr1: @vendor.phone_nbr1, phone_nbr2: @vendor.phone_nbr2, state_code: @vendor.state_code, vendor_name: @vendor.vendor_name, zip_code: @vendor.zip_code }
    assert_redirected_to vendor_path(assigns(:vendor))
  end

  test "should destroy vendor" do
    assert_difference('Vendor.count', -1) do
      delete :destroy, id: @vendor
    end

    assert_redirected_to vendors_path
  end
end
