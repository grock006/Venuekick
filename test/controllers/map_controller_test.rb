require 'test_helper'

class MapControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get showid" do
    get :showid
    assert_response :success
  end

end
