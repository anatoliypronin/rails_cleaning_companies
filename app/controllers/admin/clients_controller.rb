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

  def destroy
    client = Client.find(params[:id])
    client.destroy

    redirect_to action: :index
  end

  private

  def client_attrs
    params.require(:client).permit(:name, :surname, :email, :phone_number, :password)
  end
end
