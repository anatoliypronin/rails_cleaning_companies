class ClientMailer < ApplicationMailer
  def welcome_email(client)
    @client = client
    mail(to: @client.email, subject: default_i18n_subject(client: client.name))
  end
end
