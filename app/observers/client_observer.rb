class ClientObserver < ActiveRecord::Observer
  observe :client

  def after_commit(record)
    ClientMailer.welcome_email(record).deliver_now
  end
end
