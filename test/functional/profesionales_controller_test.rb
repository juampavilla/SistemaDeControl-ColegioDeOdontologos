require 'test_helper'

class ProfesionalesControllerTest < ActionController::TestCase
  setup do
    @profesional = profesionales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profesionales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profesional" do
    assert_difference('Profesional.count') do
      post :create, profesional: { apellido: @profesional.apellido, fecha_nacimiento: @profesional.fecha_nacimiento, nombres: @profesional.nombres, nro_doc: @profesional.nro_doc, tipo_doc: @profesional.tipo_doc }
    end

    assert_redirected_to profesional_path(assigns(:profesional))
  end

  test "should show profesional" do
    get :show, id: @profesional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profesional
    assert_response :success
  end

  test "should update profesional" do
    put :update, id: @profesional, profesional: { apellido: @profesional.apellido, fecha_nacimiento: @profesional.fecha_nacimiento, nombres: @profesional.nombres, nro_doc: @profesional.nro_doc, tipo_doc: @profesional.tipo_doc }
    assert_redirected_to profesional_path(assigns(:profesional))
  end

  test "should destroy profesional" do
    assert_difference('Profesional.count', -1) do
      delete :destroy, id: @profesional
    end

    assert_redirected_to profesionales_path
  end
end
