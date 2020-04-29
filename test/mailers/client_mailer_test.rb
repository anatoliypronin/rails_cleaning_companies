require 'test_helper'

class ClientMailerTest < ActionMailer::TestCase
  test 'welcome email for client' do
    client = create :client

    email = ClientMailer.welcome_email(client)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [client.email], email.to
  end
end
