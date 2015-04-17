require 'test_helper'

class BookByProvidersControllerTest < ActionController::TestCase
  setup do
    @book_by_provider = book_by_providers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_by_providers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_by_provider" do
    assert_difference('BookByProvider.count') do
      post :create, book_by_provider: { date: @book_by_provider.date }
    end

    assert_redirected_to book_by_provider_path(assigns(:book_by_provider))
  end

  test "should show book_by_provider" do
    get :show, id: @book_by_provider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_by_provider
    assert_response :success
  end

  test "should update book_by_provider" do
    patch :update, id: @book_by_provider, book_by_provider: { date: @book_by_provider.date }
    assert_redirected_to book_by_provider_path(assigns(:book_by_provider))
  end

  test "should destroy book_by_provider" do
    assert_difference('BookByProvider.count', -1) do
      delete :destroy, id: @book_by_provider
    end

    assert_redirected_to book_by_providers_path
  end
end
