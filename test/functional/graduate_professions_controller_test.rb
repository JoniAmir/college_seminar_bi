require 'test_helper'

class GraduateProfessionsControllerTest < ActionController::TestCase
  setup do
    @graduate_profession = graduate_professions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:graduate_professions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create graduate_profession" do
    assert_difference('GraduateProfession.count') do
      post :create, graduate_profession: { current_company: @graduate_profession.current_company, current_job: @graduate_profession.current_job, gender: @graduate_profession.gender, id_number: @graduate_profession.id_number, marital_status: @graduate_profession.marital_status, number_of_children: @graduate_profession.number_of_children, second_degree: @graduate_profession.second_degree, second_degree_institute: @graduate_profession.second_degree_institute, second_degree_type: @graduate_profession.second_degree_type, third_degree_institute: @graduate_profession.third_degree_institute, third_degree_type: @graduate_profession.third_degree_type, third_degree_years: @graduate_profession.third_degree_years }
    end

    assert_redirected_to graduate_profession_path(assigns(:graduate_profession))
  end

  test "should show graduate_profession" do
    get :show, id: @graduate_profession
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @graduate_profession
    assert_response :success
  end

  test "should update graduate_profession" do
    put :update, id: @graduate_profession, graduate_profession: { current_company: @graduate_profession.current_company, current_job: @graduate_profession.current_job, gender: @graduate_profession.gender, id_number: @graduate_profession.id_number, marital_status: @graduate_profession.marital_status, number_of_children: @graduate_profession.number_of_children, second_degree: @graduate_profession.second_degree, second_degree_institute: @graduate_profession.second_degree_institute, second_degree_type: @graduate_profession.second_degree_type, third_degree_institute: @graduate_profession.third_degree_institute, third_degree_type: @graduate_profession.third_degree_type, third_degree_years: @graduate_profession.third_degree_years }
    assert_redirected_to graduate_profession_path(assigns(:graduate_profession))
  end

  test "should destroy graduate_profession" do
    assert_difference('GraduateProfession.count', -1) do
      delete :destroy, id: @graduate_profession
    end

    assert_redirected_to graduate_professions_path
  end
end
