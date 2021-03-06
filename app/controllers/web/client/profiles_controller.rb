class Web::Client::ProfilesController < Web::Client::ApplicationController
  def show
    @client = current_client.decorate
  end

  def edit
    @client = current_client
  end

  def update
    @client = current_client

    if @client.update(clients_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def clients_params
    params.require(:client).permit(:name, :surname, :email, :password, :phone_number)
  end
end
