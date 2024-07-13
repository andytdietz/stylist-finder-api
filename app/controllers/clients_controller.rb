class ClientsController < ApplicationController
  def index
    @clients = Client.all
    render :index
  end

  def show
    @client = Client.find_by(id: params[:id])
    render :show
  end

  def update
    client = current_user.client
    if client.update(
      username: params[:username] || client.username,

    )
      render json: client, status: :ok
    else render json: { errors: client.errors.full_messages }, status: :unprocessable_entity     end
  end
end
