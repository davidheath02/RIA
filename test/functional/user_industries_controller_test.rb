require 'test_helper'

class UserIndustriesControllerTest < ActionController::TestCase
  setup do
    @user_industry = user_industries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_industries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_industry" do
    assert_difference('UserIndustry.count') do
      post :create, user_industry: { industry_name: @user_industry.industry_name, read_at: @user_industry.read_at, start_date: @user_industry.start_date, user_id: @user_industry.user_id }
    end

    assert_redirected_to user_industry_path(assigns(:user_industry))
  end

  test "should show user_industry" do
    get :show, id: @user_industry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_industry
    assert_response :success
  end

  test "should update user_industry" do
    put :update, id: @user_industry, user_industry: { industry_name: @user_industry.industry_name, read_at: @user_industry.read_at, start_date: @user_industry.start_date, user_id: @user_industry.user_id }
    assert_redirected_to user_industry_path(assigns(:user_industry))
  end

  test "should destroy user_industry" do
    assert_difference('UserIndustry.count', -1) do
      delete :destroy, id: @user_industry
    end

    assert_redirected_to user_industries_path
  end
end
