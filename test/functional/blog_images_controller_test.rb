require 'test_helper'

class BlogImagesControllerTest < ActionController::TestCase
  setup do
    @blog_image = blog_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blog_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blog_image" do
    assert_difference('BlogImage.count') do
      post :create, blog_image: { image: @blog_image.image, name: @blog_image.name, post_id: @blog_image.post_id }
    end

    assert_redirected_to blog_image_path(assigns(:blog_image))
  end

  test "should show blog_image" do
    get :show, id: @blog_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @blog_image
    assert_response :success
  end

  test "should update blog_image" do
    put :update, id: @blog_image, blog_image: { image: @blog_image.image, name: @blog_image.name, post_id: @blog_image.post_id }
    assert_redirected_to blog_image_path(assigns(:blog_image))
  end

  test "should destroy blog_image" do
    assert_difference('BlogImage.count', -1) do
      delete :destroy, id: @blog_image
    end

    assert_redirected_to blog_images_path
  end
end
