require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get aboutDevelopers" do
    get :aboutDevelopers
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get portfolio" do
    get :portfolio
    assert_response :success
  end

  test "should get aboutRuby" do
    get :aboutRuby
    assert_response :success
  end

  test "should get aboutMe" do
    get :aboutMe
    assert_response :success
  end

end
