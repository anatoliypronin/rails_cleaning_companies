module SmsService
  TEST_VERIFICATION_CODE = '1234'.freeze
  class << self
    def send_sms_code(phone_number)
      return TEST_VERIFICATION_CODE if Rails.env.test?

      code = rand(1000..9999).to_s
      message = I18n.t('verification_code', code: code)
      Gateways::SmsGateway::Client.send_sms_message(phone_number, message)
      code
    end
  end
end
