class ClientMailer < ApplicationMailer
  def welcome_email(client)
    @client = client
    mail(to: @client.email, subject: I18n.t('client_mailer.welcome.subject'))
  end
end
