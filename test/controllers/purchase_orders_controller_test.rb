require 'test_helper'

class PurchaseOrdersControllerTest < ActionController::TestCase
  setup do
    @purchase_order = purchase_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order" do
    assert_difference('PurchaseOrder.count') do
      post :create, purchase_order: { active: @purchase_order.active, added_by: @purchase_order.added_by, changed_by: @purchase_order.changed_by, remaining_weight_lbs: @purchase_order.remaining_weight_lbs, remaining_weight_tons: @purchase_order.remaining_weight_tons, required_weight_lbs: @purchase_order.required_weight_lbs, required_weight_tons: @purchase_order.required_weight_tons, sand_grade: @purchase_order.sand_grade, start_date: @purchase_order.start_date, vendor_id: @purchase_order.vendor_id, well_name: @purchase_order.well_name }
    end

    assert_redirected_to purchase_order_path(assigns(:purchase_order))
  end

  test "should show purchase_order" do
    get :show, id: @purchase_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_order
    assert_response :success
  end

  test "should update purchase_order" do
    patch :update, id: @purchase_order, purchase_order: { active: @purchase_order.active, added_by: @purchase_order.added_by, changed_by: @purchase_order.changed_by, remaining_weight_lbs: @purchase_order.remaining_weight_lbs, remaining_weight_tons: @purchase_order.remaining_weight_tons, required_weight_lbs: @purchase_order.required_weight_lbs, required_weight_tons: @purchase_order.required_weight_tons, sand_grade: @purchase_order.sand_grade, start_date: @purchase_order.start_date, vendor_id: @purchase_order.vendor_id, well_name: @purchase_order.well_name }
    assert_redirected_to purchase_order_path(assigns(:purchase_order))
  end

  test "should destroy purchase_order" do
    assert_difference('PurchaseOrder.count', -1) do
      delete :destroy, id: @purchase_order
    end

    assert_redirected_to purchase_orders_path
  end
end
