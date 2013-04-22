require 'test_helper'

class PositionsControllerTest < ActionController::TestCase
  setup do
    @position = positions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:positions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create position" do
    assert_difference('Position.count') do
      post :create, position: { company_id: @position.company_id, is_current: @position.is_current, job_id: @position.job_id, job_summary: @position.job_summary, job_title: @position.job_title, start_date: @position.start_date, user_id: @position.user_id }
    end

    assert_redirected_to position_path(assigns(:position))
  end

  test "should show position" do
    get :show, id: @position
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @position
    assert_response :success
  end

  test "should update position" do
    put :update, id: @position, position: { company_id: @position.company_id, is_current: @position.is_current, job_id: @position.job_id, job_summary: @position.job_summary, job_title: @position.job_title, start_date: @position.start_date, user_id: @position.user_id }
    assert_redirected_to position_path(assigns(:position))
  end

  test "should destroy position" do
    assert_difference('Position.count', -1) do
      delete :destroy, id: @position
    end

    assert_redirected_to positions_path
  end
end
