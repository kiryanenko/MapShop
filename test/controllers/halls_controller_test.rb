require 'test_helper'

class HallsControllerTest < ActionController::TestCase
  setup do
    @brand = Brand.create()
    @shop = Shop.create(brand_id: @brand.id)
    @hall = Hall.create(scale: 1, shop_id: @shop.id, items_url: '')
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:halls)
  end

  test "should get show" do
    get :show, id: @hall
    assert_response :success
  end

  test "should get format html" do
    get :show, id: @hall
    assert_select 'html', true
  end

  test "should get format xml" do
    get :show, id: @hall, format: 'xml'
    assert_select 'hall', true
  end
end
