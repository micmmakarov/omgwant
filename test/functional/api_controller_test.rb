require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get post" do
    get :post
    assert_response :success
  end

end
