require 'test_helper'

class Web::WelcomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get welcome page' do
    get root_path
    assert_response :success
  end
end
