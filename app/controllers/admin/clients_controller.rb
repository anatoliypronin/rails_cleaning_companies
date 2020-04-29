class Admin::ClientsController < Admin::ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_attrs)

    if @client.save
      ClientMailer.welcome_email(@client).deliver_now
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_attrs)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def del
    client = Client.find(params[:client_id])
    client.del

    redirect_to action: :index
  end

  def restore
    client = Client.find(params[:client_id])
    client.activate

    redirect_to action: :index
  end

  private

  def client_attrs
    params.require(:client).permit(:name, :surname, :email, :phone_number, :password)
  end
end
