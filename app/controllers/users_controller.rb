class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def create
    user = User.new(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      user_type: params[:user_type],
    )
    if user.user_type == "stylist"
      user.build_stylist(
        name: params[:stylist_name],
        address1: params[:address1],
        address2: params[:address2],
        city: params[:city],
        state: params[:state],
        zip: params[:zip],
        website: params[:website],
        instagram_url: params[:instagram_url],
        facebook_url: params[:facebook_url],
        booking_url: params[:booking_url],
      )
    end
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end
