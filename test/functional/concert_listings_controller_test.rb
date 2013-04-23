require 'test_helper'

class ConcertListingsControllerTest < ActionController::TestCase
  setup do
    @concert_listing = concert_listings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:concert_listings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create concert_listing" do
    assert_difference('ConcertListing.count') do
      post :create, concert_listing: { description: @concert_listing.description, title: @concert_listing.title }
    end

    assert_redirected_to concert_listing_path(assigns(:concert_listing))
  end

  test "should show concert_listing" do
    get :show, id: @concert_listing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @concert_listing
    assert_response :success
  end

  test "should update concert_listing" do
    put :update, id: @concert_listing, concert_listing: { description: @concert_listing.description, title: @concert_listing.title }
    assert_redirected_to concert_listing_path(assigns(:concert_listing))
  end

  test "should destroy concert_listing" do
    assert_difference('ConcertListing.count', -1) do
      delete :destroy, id: @concert_listing
    end

    assert_redirected_to concert_listings_path
  end
end
