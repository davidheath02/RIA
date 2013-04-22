require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get statistics" do
    get :statistics
    assert_response :success
  end

end
