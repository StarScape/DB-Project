require 'test_helper'

class SpareKeysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spare_key = spare_keys(:one)
  end

  test "should get index" do
    get spare_keys_url
    assert_response :success
  end

  test "should get new" do
    get new_spare_key_url
    assert_response :success
  end

  test "should create spare_key" do
    assert_difference('SpareKey.count') do
      post spare_keys_url, params: { spare_key: { barcode: @spare_key.barcode, keycode: @spare_key.keycode } }
    end

    assert_redirected_to spare_key_url(SpareKey.last)
  end

  test "should show spare_key" do
    get spare_key_url(@spare_key)
    assert_response :success
  end

  test "should get edit" do
    get edit_spare_key_url(@spare_key)
    assert_response :success
  end

  test "should update spare_key" do
    patch spare_key_url(@spare_key), params: { spare_key: { barcode: @spare_key.barcode, keycode: @spare_key.keycode } }
    assert_redirected_to spare_key_url(@spare_key)
  end

  test "should destroy spare_key" do
    assert_difference('SpareKey.count', -1) do
      delete spare_key_url(@spare_key)
    end

    assert_redirected_to spare_keys_url
  end
end
