require 'test_helper'

class BookInUsesControllerTest < ActionController::TestCase
  setup do
    @book_in_use = book_in_uses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_in_uses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_in_use" do
    assert_difference('BookInUse.count') do
      post :create, book_in_use: { fromDate: @book_in_use.fromDate, returnDate: @book_in_use.returnDate, toDate: @book_in_use.toDate }
    end

    assert_redirected_to book_in_use_path(assigns(:book_in_use))
  end

  test "should show book_in_use" do
    get :show, id: @book_in_use
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_in_use
    assert_response :success
  end

  test "should update book_in_use" do
    patch :update, id: @book_in_use, book_in_use: { fromDate: @book_in_use.fromDate, returnDate: @book_in_use.returnDate, toDate: @book_in_use.toDate }
    assert_redirected_to book_in_use_path(assigns(:book_in_use))
  end

  test "should destroy book_in_use" do
    assert_difference('BookInUse.count', -1) do
      delete :destroy, id: @book_in_use
    end

    assert_redirected_to book_in_uses_path
  end
end
