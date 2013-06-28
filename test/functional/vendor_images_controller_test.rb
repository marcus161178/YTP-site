require 'test_helper'

class VendorImagesControllerTest < ActionController::TestCase
  setup do
    @vendor_image = vendor_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendor_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor_image" do
    assert_difference('VendorImage.count') do
      post :create, vendor_image: { name: @vendor_image.name, portfolio: @vendor_image.portfolio, subcategory_id: @vendor_image.subcategory_id }
    end

    assert_redirected_to vendor_image_path(assigns(:vendor_image))
  end

  test "should show vendor_image" do
    get :show, id: @vendor_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor_image
    assert_response :success
  end

  test "should update vendor_image" do
    put :update, id: @vendor_image, vendor_image: { name: @vendor_image.name, portfolio: @vendor_image.portfolio, subcategory_id: @vendor_image.subcategory_id }
    assert_redirected_to vendor_image_path(assigns(:vendor_image))
  end

  test "should destroy vendor_image" do
    assert_difference('VendorImage.count', -1) do
      delete :destroy, id: @vendor_image
    end

    assert_redirected_to vendor_images_path
  end
end
