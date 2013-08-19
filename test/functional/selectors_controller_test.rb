require 'test_helper'

class SelectorsControllerTest < ActionController::TestCase
  setup do
    @selector = selectors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selectors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selector" do
    assert_difference('Selector.count') do
      post :create, selector: {  }
    end

    assert_redirected_to selector_path(assigns(:selector))
  end

  test "should show selector" do
    get :show, id: @selector
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selector
    assert_response :success
  end

  test "should update selector" do
    put :update, id: @selector, selector: {  }
    assert_redirected_to selector_path(assigns(:selector))
  end

  test "should destroy selector" do
    assert_difference('Selector.count', -1) do
      delete :destroy, id: @selector
    end

    assert_redirected_to selectors_path
  end
end
