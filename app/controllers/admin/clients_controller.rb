class Admin::ClientsController < Admin::ApplicationController
  def index
    @clients = Client.all
  end

  def new 
    @clients = Client.new
  end
end
