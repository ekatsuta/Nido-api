class ListingsController < ApplicationController
  def index
    listings = Listing.all
    render json: listings
  end

  def show
    listing = Listing.find(params[:id])
    render json: listing
  end

  def create

    listing = Listing.create(
      user_id: params[:user_id],
      title: params[:listing][:title],
      address: params[:listing][:address],
      room_type: params[:listing][:room_type],
      capacity: params[:listing][:capacity],
      description: params[:listing][:description],
      household_type: params[:listing][:household_type],
      guest_preference: params[:listing][:guest_preference],
      children: params[:listing][:children],
      longitude: params[:longitude],
      latitude: params[:latitude]
    )


    picture = Picture.create(
      listing_id: listing.id,
      image_url: params[:listing][:img_url]
    )

    Language.createLinks(params[:listing][:languages], listing.id)
    Provision.createLinks(params[:listing][:provisions], listing.id)

    render json: listing
  end

  def update
    listing = Listing.find(params[:id])
    listing.update(listing_params)
    render json: listing
  end

  def destroy
    listing = Listing.find(params[:id])
    listing.destroy
    render json: {message: "successfully deleted"}
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :address, :room_type, :capacity, :description, :household_type, :guest_preference, :children)
  end

end
