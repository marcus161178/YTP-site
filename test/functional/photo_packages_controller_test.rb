require 'test_helper'

class PhotoPackagesControllerTest < ActionController::TestCase
  setup do
    @photo_package = photo_packages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_packages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_package" do
    assert_difference('PhotoPackage.count') do
      post :create, photo_package: { description: @photo_package.description, name: @photo_package.name, price: @photo_package.price }
    end

    assert_redirected_to photo_package_path(assigns(:photo_package))
  end

  test "should show photo_package" do
    get :show, id: @photo_package
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_package
    assert_response :success
  end

  test "should update photo_package" do
    put :update, id: @photo_package, photo_package: { description: @photo_package.description, name: @photo_package.name, price: @photo_package.price }
    assert_redirected_to photo_package_path(assigns(:photo_package))
  end

  test "should destroy photo_package" do
    assert_difference('PhotoPackage.count', -1) do
      delete :destroy, id: @photo_package
    end

    assert_redirected_to photo_packages_path
  end
end
