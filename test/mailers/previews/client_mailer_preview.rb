# Preview all emails at http://localhost:3000/rails/mailers/client_mailer
class ClientMailerPreview < ActionMailer::Preview
  def welcome_email
      client = FactoryBot.create :client
      ClientMailer.welcome_email(client)
  end
end
