require 'test_helper'

class EvaluadorsControllerTest < ActionController::TestCase
  setup do
    @evaluador = evaluadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluador" do
    assert_difference('Evaluador.count') do
      post :create, evaluador: { apellido: @evaluador.apellido, cedula: @evaluador.cedula, cedula: @evaluador.cedula, doctorado: @evaluador.doctorado, especializacion: @evaluador.especializacion, maestria: @evaluador.maestria, titulo: @evaluador.titulo, universidad: @evaluador.universidad }
    end

    assert_redirected_to evaluador_path(assigns(:evaluador))
  end

  test "should show evaluador" do
    get :show, id: @evaluador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluador
    assert_response :success
  end

  test "should update evaluador" do
    patch :update, id: @evaluador, evaluador: { apellido: @evaluador.apellido, cedula: @evaluador.cedula, cedula: @evaluador.cedula, doctorado: @evaluador.doctorado, especializacion: @evaluador.especializacion, maestria: @evaluador.maestria, titulo: @evaluador.titulo, universidad: @evaluador.universidad }
    assert_redirected_to evaluador_path(assigns(:evaluador))
  end

  test "should destroy evaluador" do
    assert_difference('Evaluador.count', -1) do
      delete :destroy, id: @evaluador
    end

    assert_redirected_to evaluadors_path
  end
end
