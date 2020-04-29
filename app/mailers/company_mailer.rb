class CompanyMailer < ApplicationMailer
  def welcome_email(company)
    @company = company
    mail(to: @company.email, subject: default_i18n_subject(company: company.name))
  end
end
