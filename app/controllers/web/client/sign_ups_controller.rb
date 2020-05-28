class Web::Client::SignUpsController < Web::Client::ApplicationController
  skip_before_action :authenticate_client!, only: %i[new create]
  def new; end

  def create
    client = Client.new(client_attrs)
    if client.save
      client_sign_in(client)
      redirect_to client_profile_path
    else
      render action: :new
    end
  end

  private

  def client_attrs
    params.require(:client).permit(:name, :surname, :email, :phone_number, :password)
  end
end