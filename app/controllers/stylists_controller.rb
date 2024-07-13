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
    stylist = current_user.stylist
    if stylist.update(
      name: params[:name] || stylist.name,
      address1: params[:address1] || stylist.address1,
      address2: params[:address2] || stylist.address2,
      city: params[:city] || stylist.city,
      state: params[:state] || stylist.state,
      zip: params[:zip] || stylist.zip,
      website: params[:website] || stylist.website,
      instagram_url: params[:instagram_url] || stylist.instagram_url,
      facebook_url: params[:facebook_url] || stylist.facebook_url,
      booking_url: params[:booking_url] || stylist.booking_url,
    )
      render json: stylist, status: :ok
    else render json: { errors: stylist.errors.full_messages }, status: :unprocessable_entity     end
  end
end
