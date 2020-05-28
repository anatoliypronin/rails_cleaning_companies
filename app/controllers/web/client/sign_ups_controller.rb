class Web::Client::SignUpsController < Web::Client::ApplicationController
  skip_before_validation :authenticate_client!, only: %i[new create]
  def new; end
end