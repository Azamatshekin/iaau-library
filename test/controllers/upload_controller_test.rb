require 'test_helper'

class UploadControllerTest < ActionController::TestCase
  test "should get upload_page" do
    get :upload_page
    assert_response :success
  end

end
