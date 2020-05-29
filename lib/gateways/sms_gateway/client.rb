require 'curb'

module Gateways::SmsGateway::Client
  module_function

  def send_sms_message(phone_number, message)
    query = 'https://email:APIkey@gate.smsaero.ru/v2/sms/send?number=' \
    "#{phone_number}&text=#{message}&sign=SMS Aero&channel=DIRECT"
    http = Curl::Easy.new(query)
    http.perform
  end
end
