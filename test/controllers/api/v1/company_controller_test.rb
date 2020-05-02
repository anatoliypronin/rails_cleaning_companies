require 'test_helper'

class Api::V1::CompanyControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create :company
  end

  test 'should get company list' do
    get api_v1_company_index_path
    assert_response :success
  end

  test 'should get company info' do
    get api_v1_company_index_path
    assert_response :success
  end
end
