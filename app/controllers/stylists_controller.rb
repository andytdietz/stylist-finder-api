class StylistsController < ApplicationController
  def index
    @stylists = Stylist.all
    render :index
  end

  def show
    @stylist = Stylist.find_by(id: params[:id])
    render :show
  end

  def update
    @
  end
end
