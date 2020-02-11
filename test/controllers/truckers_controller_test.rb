require 'test_helper'

class TruckersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get truckers_index_url
    assert_response :success
  end

end
