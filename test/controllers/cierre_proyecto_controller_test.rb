require 'test_helper'

class CierreProyectoControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
