require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  test "Should create" do
    service = build :service
    service.save

    created_service = Service.last
    assert created_service
  end

  test "Empty service" do
    service = build :service, name: nil
    service.save

    created_service = Service.last
    assert_not created_service
  end

  test "Lesser than minimum" do
    service = build :service, name: 'Test'
    service.save

    created_service = Service.last
    assert_not created_service
  end
end
