require 'test_helper'

class CustomControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get photogallery" do
    get :photogallery
    assert_response :success
  end

  test "should get clienthome" do
    get :clienthome
    assert_response :success
  end

end
