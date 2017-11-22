require 'test_helper'

class ExampleInputsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @example_input = example_inputs(:one)
  end

  test "should get index" do
    get example_inputs_url
    assert_response :success
  end

  test "should get new" do
    get new_example_input_url
    assert_response :success
  end

  test "should create example_input" do
    assert_difference('ExampleInput.count') do
      post example_inputs_url, params: { example_input: { itemdescription: @example_input.itemdescription, itemprice: @example_input.itemprice, merchantaddress: @example_input.merchantaddress, merchantname: @example_input.merchantname, purchasecount: @example_input.purchasecount, purchasername: @example_input.purchasername } }
    end

    assert_redirected_to example_input_url(ExampleInput.last)
  end

  test "should show example_input" do
    get example_input_url(@example_input)
    assert_response :success
  end

  test "should get edit" do
    get edit_example_input_url(@example_input)
    assert_response :success
  end

  test "should update example_input" do
    patch example_input_url(@example_input), params: { example_input: { itemdescription: @example_input.itemdescription, itemprice: @example_input.itemprice, merchantaddress: @example_input.merchantaddress, merchantname: @example_input.merchantname, purchasecount: @example_input.purchasecount, purchasername: @example_input.purchasername } }
    assert_redirected_to example_input_url(@example_input)
  end

  test "should destroy example_input" do
    assert_difference('ExampleInput.count', -1) do
      delete example_input_url(@example_input)
    end

    assert_redirected_to example_inputs_url
  end
end
