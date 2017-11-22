require 'test_helper'

class ModelControllerTest < ActionDispatch::IntegrationTest
  test "should get item" do
    get model_item_url
    assert_response :success
  end

  test "should get description:string" do
    get model_description:string_url
    assert_response :success
  end

  test "should get price:float" do
    get model_price:float_url
    assert_response :success
  end

end
