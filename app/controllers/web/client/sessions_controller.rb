class Web::Client::SessionsController < Web::Client::ApplicationController
  skip_before_action :authenticate_client!, only: %i[new create]
  def new; end

  def create
    client = Client.find_by(email: params[:client][:email])
    if client&.authenticate(params[:client][:password])
      client_sign_in(client)
      redirect_to client_profile_path
    else
      render action: :new
    end
  end

  def destroy
    client_sign_out
    redirect_to root_path
  end
end
