class ClientsController < ApplicationController
  def index
    @clients = clients.all
    render :index
  end

  def show
    @client = Client.find_by(id: params[:id])
    render :show
  end
end
