require 'test_helper'

class HowtodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @howtodo = howtodos(:one)
  end

  test "should get index" do
    get howtodos_url
    assert_response :success
  end

  test "should get new" do
    get new_howtodo_url
    assert_response :success
  end

  test "should create howtodo" do
    assert_difference('Howtodo.count') do
      post howtodos_url, params: { howtodo: { description: @howtodo.description, title: @howtodo.title } }
    end

    assert_redirected_to howtodo_url(Howtodo.last)
  end

  test "should show howtodo" do
    get howtodo_url(@howtodo)
    assert_response :success
  end

  test "should get edit" do
    get edit_howtodo_url(@howtodo)
    assert_response :success
  end

  test "should update howtodo" do
    patch howtodo_url(@howtodo), params: { howtodo: { description: @howtodo.description, title: @howtodo.title } }
    assert_redirected_to howtodo_url(@howtodo)
  end

  test "should destroy howtodo" do
    assert_difference('Howtodo.count', -1) do
      delete howtodo_url(@howtodo)
    end

    assert_redirected_to howtodos_url
  end
end
