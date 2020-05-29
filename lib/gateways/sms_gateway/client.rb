require 'curb'

module Gateways::SmsGateway::Client
  module_function

  def send_sms_message(phone_number, message)
    http = Curl::Easy.new("https://email:api_keyGM6IxNtjKOpPwipx2amJKbgkGnCv@gate.smsaero.ru/v2/sms/send?number=
                          #{phone_number}&text=#{message}&sign=SMS Aero&channel=DIRECT")
    http.perform
  end
end
