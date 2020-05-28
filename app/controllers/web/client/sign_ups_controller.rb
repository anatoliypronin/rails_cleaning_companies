class Web::Client::SignUpsController < Web::Client::ApplicationController
  skip_before_validation :client_sign_in!, only: %i[new create]
  def new; end
end