require 'test_helper'

class UserAccessLevelsControllerTest < ActionController::TestCase
  setup do
    @user_access_level = user_access_levels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_access_levels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_access_level" do
    assert_difference('UserAccessLevel.count') do
      post :create, user_access_level: { access_level: @user_access_level.access_level }
    end

    assert_redirected_to user_access_level_path(assigns(:user_access_level))
  end

  test "should show user_access_level" do
    get :show, id: @user_access_level
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_access_level
    assert_response :success
  end

  test "should update user_access_level" do
    patch :update, id: @user_access_level, user_access_level: { access_level: @user_access_level.access_level }
    assert_redirected_to user_access_level_path(assigns(:user_access_level))
  end

  test "should destroy user_access_level" do
    assert_difference('UserAccessLevel.count', -1) do
      delete :destroy, id: @user_access_level
    end

    assert_redirected_to user_access_levels_path
  end
end
