require 'test_helper'

class DomiciliosControllerTest < ActionController::TestCase
  setup do
    @domicilio = domicilios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:domicilios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create domicilio" do
    assert_difference('Domicilio.count') do
      post :create, domicilio: { cp: @domicilio.cp, domicilio: @domicilio.domicilio, localidad: @domicilio.localidad, notas: @domicilio.notas, profesional_id: @domicilio.profesional_id, telefono: @domicilio.telefono, tipo: @domicilio.tipo }
    end

    assert_redirected_to domicilio_path(assigns(:domicilio))
  end

  test "should show domicilio" do
    get :show, id: @domicilio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @domicilio
    assert_response :success
  end

  test "should update domicilio" do
    put :update, id: @domicilio, domicilio: { cp: @domicilio.cp, domicilio: @domicilio.domicilio, localidad: @domicilio.localidad, notas: @domicilio.notas, profesional_id: @domicilio.profesional_id, telefono: @domicilio.telefono, tipo: @domicilio.tipo }
    assert_redirected_to domicilio_path(assigns(:domicilio))
  end

  test "should destroy domicilio" do
    assert_difference('Domicilio.count', -1) do
      delete :destroy, id: @domicilio
    end

    assert_redirected_to domicilios_path
  end
end
