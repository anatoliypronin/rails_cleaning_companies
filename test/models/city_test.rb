require 'test_helper'

class CityTest < ActiveSupport::TestCase
  test 'Should create City' do
    city = build :city
    city.save

    created_city = City.last
    assert created_city
  end

  test 'Should not create City' do
    city = build :city, name: nil
    city.save

    created_city = City.last
    assert_not created_city
  end

  test 'Lesser than minimum' do
    city = build :city, name: 'Ker'
    city.save

    created_city = City.last
    assert_not created_city
  end
end
