require 'test_helper'

class Admin::GlasshouseControllerTest < ActionController::TestCase
  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get logout" do
    get :logout
    assert_response :success
  end

  test "should get stage" do
    get :stage
    assert_response :success
  end

end
