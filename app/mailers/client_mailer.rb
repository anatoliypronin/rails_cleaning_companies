class ClientMailer < ApplicationMailer
  def welcome_email(client)
    @client = client
    mail(to: @client.email, subject: "TEST TEST TEST" )
  end
end
