require 'test_helper'

class CompanyMailerTest < ActionMailer::TestCase
 test 'Welcome email company' do
   company = create :company

   email = CompanyMailer.welcome_email(company)
   assert_emails 1 do
     email.deliver_now
   end
   assert_equal [company.email],email.to
   assert_equal ['from@example.com'], email.from
  end
end
