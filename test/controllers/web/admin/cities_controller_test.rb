require 'test_helper'

class Web::Admin::CityControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create :admin
    sign_in_as_admin(@admin)
    @city = create :city
  end

  test 'should get index cities page' do
    get admin_cities_path
    assert_response :success
  end

  test 'should get new city page' do
    get new_admin_city_path
    assert_response :success
  end

  test 'should post create admin' do
    cities_attrs = attributes_for :city
    post admin_cities_path, params: { city: cities_attrs }
    assert_response :redirect
    city = City.last
    assert_equal cities_attrs[:name], city.name
  end

  test 'should deleted  city' do
    delete admin_city_path(@city)
    assert_response :redirect
  end

  test 'should not get new city page for editor' do
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    get new_admin_city_path
    assert_redirected_to admin_root_path
  end

  test 'should not post create city by editor' do
    cities_attrs = attributes_for :city
    sign_out_as_admin
    editor = create :admin, :editor
    sign_in_as_admin(editor)
    post admin_cities_path, params: { city: cities_attrs }
    assert_redirected_to admin_root_path
    city = City.last
    assert_not_equal cities_attrs[:name], city.name
  end
end
