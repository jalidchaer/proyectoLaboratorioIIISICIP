require 'test_helper'

class InvestigadorControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get registrar_proyecto" do
    get :registrar_proyecto
    assert_response :success
  end

end
