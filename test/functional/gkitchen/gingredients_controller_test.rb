require 'test_helper'

class Gkitchen::GingredientsControllerTest < ActionController::TestCase
  setup do
    @gkitchen_gingredient = gkitchen_gingredients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gkitchen_gingredients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gkitchen_gingredient" do
    assert_difference('Gkitchen::Gingredient.count') do
      post :create, gkitchen_gingredient: @gkitchen_gingredient.attributes
    end

    assert_redirected_to gkitchen_gingredient_path(assigns(:gkitchen_gingredient))
  end

  test "should show gkitchen_gingredient" do
    get :show, id: @gkitchen_gingredient.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gkitchen_gingredient.to_param
    assert_response :success
  end

  test "should update gkitchen_gingredient" do
    put :update, id: @gkitchen_gingredient.to_param, gkitchen_gingredient: @gkitchen_gingredient.attributes
    assert_redirected_to gkitchen_gingredient_path(assigns(:gkitchen_gingredient))
  end

  test "should destroy gkitchen_gingredient" do
    assert_difference('Gkitchen::Gingredient.count', -1) do
      delete :destroy, id: @gkitchen_gingredient.to_param
    end

    assert_redirected_to gkitchen_gingredients_path
  end
end
