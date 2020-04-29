class CompanyObserver < ActiveRecord::Observer
  observe :Company

  def after_save(record)
    CompanyMailer.welcome_email(record).deliver_now
  end
end
