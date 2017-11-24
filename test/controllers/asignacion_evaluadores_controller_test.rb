require 'test_helper'

class AsignacionEvaluadoresControllerTest < ActionController::TestCase
  test "should get datos_proyecto" do
    get :datos_proyecto
    assert_response :success
  end

end
