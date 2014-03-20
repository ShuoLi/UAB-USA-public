require 'test_helper'

class ManufactoriesControllerTest < ActionController::TestCase
  setup do
    @manufactory = manufactories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manufactories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manufactory" do
    assert_difference('Manufactory.count') do
      post :create, manufactory: {  }
    end

    assert_redirected_to manufactory_path(assigns(:manufactory))
  end

  test "should show manufactory" do
    get :show, id: @manufactory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manufactory
    assert_response :success
  end

  test "should update manufactory" do
    put :update, id: @manufactory, manufactory: {  }
    assert_redirected_to manufactory_path(assigns(:manufactory))
  end

  test "should destroy manufactory" do
    assert_difference('Manufactory.count', -1) do
      delete :destroy, id: @manufactory
    end

    assert_redirected_to manufactories_path
  end
end
