require 'test_helper'

class WorkersControllerTest < ActionController::TestCase
  setup do
    @worker = workers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worker" do
    assert_difference('Worker.count') do
      post :create, worker: { active: @worker.active, added_by: @worker.added_by, address_line_1: @worker.address_line_1, address_line_2: @worker.address_line_2, badge_nbr: @worker.badge_nbr, changed_by: @worker.changed_by, city_name: @worker.city_name, comments: @worker.comments, effective_date: @worker.effective_date, email: @worker.email, first_name: @worker.first_name, last_name: @worker.last_name, state_code: @worker.state_code, zip_code: @worker.zip_code }
    end

    assert_redirected_to worker_path(assigns(:worker))
  end

  test "should show worker" do
    get :show, id: @worker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worker
    assert_response :success
  end

  test "should update worker" do
    patch :update, id: @worker, worker: { active: @worker.active, added_by: @worker.added_by, address_line_1: @worker.address_line_1, address_line_2: @worker.address_line_2, badge_nbr: @worker.badge_nbr, changed_by: @worker.changed_by, city_name: @worker.city_name, comments: @worker.comments, effective_date: @worker.effective_date, email: @worker.email, first_name: @worker.first_name, last_name: @worker.last_name, state_code: @worker.state_code, zip_code: @worker.zip_code }
    assert_redirected_to worker_path(assigns(:worker))
  end

  test "should destroy worker" do
    assert_difference('Worker.count', -1) do
      delete :destroy, id: @worker
    end

    assert_redirected_to workers_path
  end
end
