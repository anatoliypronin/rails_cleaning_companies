# Preview all emails at http://localhost:3000/rails/mailers/client_mailer
class ClientMailerPreview < ActionMailer::Preview
  def welcome_email
    client = Struct.new(:email, :name).new('name@example.com', 'Test User')
    ClientMailer.welcome_email(client)
  end
end
