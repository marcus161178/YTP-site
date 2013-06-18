require 'test_helper'

class ClientVideosControllerTest < ActionController::TestCase
  setup do
    @client_video = client_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_video" do
    assert_difference('ClientVideo.count') do
      post :create, client_video: { client_id: @client_video.client_id, name: @client_video.name, url: @client_video.url }
    end

    assert_redirected_to client_video_path(assigns(:client_video))
  end

  test "should show client_video" do
    get :show, id: @client_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_video
    assert_response :success
  end

  test "should update client_video" do
    put :update, id: @client_video, client_video: { client_id: @client_video.client_id, name: @client_video.name, url: @client_video.url }
    assert_redirected_to client_video_path(assigns(:client_video))
  end

  test "should destroy client_video" do
    assert_difference('ClientVideo.count', -1) do
      delete :destroy, id: @client_video
    end

    assert_redirected_to client_videos_path
  end
end
