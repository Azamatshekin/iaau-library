require 'test_helper'

class ReadersControllerTest < ActionController::TestCase
  setup do
    @reader = readers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:readers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reader" do
    assert_difference('Reader.count') do
      post :create, reader: { address: @reader.address, birth_date: @reader.birth_date, email: @reader.email, name: @reader.name, passport: @reader.passport, photo: @reader.photo, surname: @reader.surname }
    end

    assert_redirected_to reader_path(assigns(:reader))
  end

  test "should show reader" do
    get :show, id: @reader
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reader
    assert_response :success
  end

  test "should update reader" do
    patch :update, id: @reader, reader: { address: @reader.address, birth_date: @reader.birth_date, email: @reader.email, name: @reader.name, passport: @reader.passport, photo: @reader.photo, surname: @reader.surname }
    assert_redirected_to reader_path(assigns(:reader))
  end

  test "should destroy reader" do
    assert_difference('Reader.count', -1) do
      delete :destroy, id: @reader
    end

    assert_redirected_to readers_path
  end
end
