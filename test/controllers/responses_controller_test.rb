require 'test_helper'

class ResponsesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get random" do
    get :random
    assert_response :success
  end

end
