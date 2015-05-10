require 'test_helper'

class PublicControllerTest < ActionController::TestCase
  test "should get AccessDenied" do
    get :AccessDenied
    assert_response :success
  end

  test "should get Unauthorized" do
    get :Unauthorized
    assert_response :success
  end

end
