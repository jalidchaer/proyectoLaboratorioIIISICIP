require 'test_helper'

class FormControllerTest < ActionController::TestCase
  test "should get indez" do
    get :indez
    assert_response :success
  end

end
