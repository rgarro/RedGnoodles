require 'test_helper'

class GmapControllerTest < ActionController::TestCase
  test "should get showlist" do
    get :showlist
    assert_response :success
  end

  test "should get addplace" do
    get :addplace
    assert_response :success
  end

end
