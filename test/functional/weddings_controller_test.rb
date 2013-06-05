require 'test_helper'

class WeddingsControllerTest < ActionController::TestCase
  setup do
    @wedding = weddings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weddings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wedding" do
    assert_difference('Wedding.count') do
      post :create, wedding: { bride_getting_ready: @wedding.bride_getting_ready, bridesmaids: @wedding.bridesmaids, ceremony_location: @wedding.ceremony_location, ceremony_setting: @wedding.ceremony_setting, ceremony_time: @wedding.ceremony_time, cinematography: @wedding.cinematography, country: @wedding.country, date: @wedding.date, engagement_shoot: @wedding.engagement_shoot, groom_getting_ready: @wedding.groom_getting_ready, groomsmen: @wedding.groomsmen, how_did_you_find_us: @wedding.how_did_you_find_us, notes: @wedding.notes, number_of_guests: @wedding.number_of_guests, order_of_events: @wedding.order_of_events, payment_currency: @wedding.payment_currency, payment_method: @wedding.payment_method, photo_package_id: @wedding.photo_package_id, photography_style: @wedding.photography_style, reception_location: @wedding.reception_location, recommended_by: @wedding.recommended_by, type_of_ceremony_id: @wedding.type_of_ceremony_id }
    end

    assert_redirected_to wedding_path(assigns(:wedding))
  end

  test "should show wedding" do
    get :show, id: @wedding
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wedding
    assert_response :success
  end

  test "should update wedding" do
    put :update, id: @wedding, wedding: { bride_getting_ready: @wedding.bride_getting_ready, bridesmaids: @wedding.bridesmaids, ceremony_location: @wedding.ceremony_location, ceremony_setting: @wedding.ceremony_setting, ceremony_time: @wedding.ceremony_time, cinematography: @wedding.cinematography, country: @wedding.country, date: @wedding.date, engagement_shoot: @wedding.engagement_shoot, groom_getting_ready: @wedding.groom_getting_ready, groomsmen: @wedding.groomsmen, how_did_you_find_us: @wedding.how_did_you_find_us, notes: @wedding.notes, number_of_guests: @wedding.number_of_guests, order_of_events: @wedding.order_of_events, payment_currency: @wedding.payment_currency, payment_method: @wedding.payment_method, photo_package_id: @wedding.photo_package_id, photography_style: @wedding.photography_style, reception_location: @wedding.reception_location, recommended_by: @wedding.recommended_by, type_of_ceremony_id: @wedding.type_of_ceremony_id }
    assert_redirected_to wedding_path(assigns(:wedding))
  end

  test "should destroy wedding" do
    assert_difference('Wedding.count', -1) do
      delete :destroy, id: @wedding
    end

    assert_redirected_to weddings_path
  end
end
