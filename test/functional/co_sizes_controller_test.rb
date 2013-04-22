require 'test_helper'

class CoSizesControllerTest < ActionController::TestCase
  setup do
    @co_size = co_sizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:co_sizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create co_size" do
    assert_difference('CoSize.count') do
      post :create, co_size: { company_id: @co_size.company_id, no_employees: @co_size.no_employees, read_at: @co_size.read_at }
    end

    assert_redirected_to co_size_path(assigns(:co_size))
  end

  test "should show co_size" do
    get :show, id: @co_size
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @co_size
    assert_response :success
  end

  test "should update co_size" do
    put :update, id: @co_size, co_size: { company_id: @co_size.company_id, no_employees: @co_size.no_employees, read_at: @co_size.read_at }
    assert_redirected_to co_size_path(assigns(:co_size))
  end

  test "should destroy co_size" do
    assert_difference('CoSize.count', -1) do
      delete :destroy, id: @co_size
    end

    assert_redirected_to co_sizes_path
  end
end
