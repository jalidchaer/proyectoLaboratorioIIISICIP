require 'test_helper'

class EvaluadoresControllerTest < ActionController::TestCase
  setup do
    @evaluadore = evaluadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:evaluadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create evaluadore" do
    assert_difference('Evaluadore.count') do
      post :create, evaluadore: { apellido: @evaluadore.apellido, cedula: @evaluadore.cedula, cedula: @evaluadore.cedula, doctorado: @evaluadore.doctorado, especializacion: @evaluadore.especializacion, maestria: @evaluadore.maestria, titulo: @evaluadore.titulo, universidad: @evaluadore.universidad }
    end

    assert_redirected_to evaluadore_path(assigns(:evaluadore))
  end

  test "should show evaluadore" do
    get :show, id: @evaluadore
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @evaluadore
    assert_response :success
  end

  test "should update evaluadore" do
    patch :update, id: @evaluadore, evaluadore: { apellido: @evaluadore.apellido, cedula: @evaluadore.cedula, cedula: @evaluadore.cedula, doctorado: @evaluadore.doctorado, especializacion: @evaluadore.especializacion, maestria: @evaluadore.maestria, titulo: @evaluadore.titulo, universidad: @evaluadore.universidad }
    assert_redirected_to evaluadore_path(assigns(:evaluadore))
  end

  test "should destroy evaluadore" do
    assert_difference('Evaluadore.count', -1) do
      delete :destroy, id: @evaluadore
    end

    assert_redirected_to evaluadores_path
  end
end
