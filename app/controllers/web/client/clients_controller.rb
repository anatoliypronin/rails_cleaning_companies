class Web::Client::ClientsController < Web::Client::ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(clients_params)
    if @client.save
      redirect_to client_path(@client.id)
    else
      render action: :new
    end
  end

  def show
    @client = Client.find(current_client.id).decorate
  end

  def edit
    @client = Client.find(current_client.id)
  end

  def update
    @client = Client.find(current_client.id)

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
