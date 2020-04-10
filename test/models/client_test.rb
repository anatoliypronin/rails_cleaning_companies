require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test 'should create client' do
    client = build :client
    client.save

    created_client = Client.last
    assert created_client
  end

  test 'Not enough numbers in phone number' do
    client = build :client, phone_number: '8'
    client.save

    created_client = Client.last
    assert_nil created_client
  end

  test 'Letters in phonenumber' do
    client = build :client, phone_number: '8900900WHOOP'
    client.save

    created_client = Client.last
    assert_nil created_client
  end

  test 'Not a email' do
    client = build :client, email: 'Test.ru'
    client.save

    created_client = Client.last
    assert_nil created_client
  end

  test 'Small password' do
    client = build :client, password_digest: '123'
    client.save

    created_client = Client.last
    assert_nil created_client
  end
end
