class CompanyMailerPreview < ActionMailer::Preview
  def welcome_email
    company = FactoryBot.create :company
    CompanyMailer.welcome_email(company)
  end
end
