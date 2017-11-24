require 'test_helper'

class ProyectosControllerTest < ActionController::TestCase
  setup do
    @proyecto = proyectos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proyectos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proyecto" do
    assert_difference('Proyecto.count') do
      post :create, proyecto: { codigo: @proyecto.codigo, duracion: @proyecto.duracion, estado: @proyecto.estado, fecha: @proyecto.fecha, monto: @proyecto.monto, objetivogeneral: @proyecto.objetivogeneral, objetivosespecifo: @proyecto.objetivosespecifo, responsable: @proyecto.responsable, resumen: @proyecto.resumen, titulo: @proyecto.titulo }
    end

    assert_redirected_to proyecto_path(assigns(:proyecto))
  end

  test "should show proyecto" do
    get :show, id: @proyecto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proyecto
    assert_response :success
  end

  test "should update proyecto" do
    patch :update, id: @proyecto, proyecto: { codigo: @proyecto.codigo, duracion: @proyecto.duracion, estado: @proyecto.estado, fecha: @proyecto.fecha, monto: @proyecto.monto, objetivogeneral: @proyecto.objetivogeneral, objetivosespecifo: @proyecto.objetivosespecifo, responsable: @proyecto.responsable, resumen: @proyecto.resumen, titulo: @proyecto.titulo }
    assert_redirected_to proyecto_path(assigns(:proyecto))
  end

  test "should destroy proyecto" do
    assert_difference('Proyecto.count', -1) do
      delete :destroy, id: @proyecto
    end

    assert_redirected_to proyectos_path
  end
end
