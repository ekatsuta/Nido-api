class PlacementsController < ApplicationController

  def index
    placements = Placement.all
    render json: placements
  end

  def create
    period = params[:startDate]+","+params[:endDate]
    placement = Placement.new(listing_id: params[:listing_id], case_id: params[:case_id], period: period.to_s, status: "pending", checked: false)

    if placement.valid?
      placement.save
      render json: placement
    else

      byebug
    end

  end

  def update
    placement = Placement.find(params[:id])
    if params[:status] === 'approved'
      listing = Listing.find(placement.listing_id)
      listing_placements = listing.placements
      overlap = Listing.checkOverlap(listing_placements, placement)
      if overlap
        render json: {errors: "You already have a guest during this time period"}
      else
        placement.update(status: params[:status], checked: true)
        render json: placement
      end
    else
      placement.update(status: params[:status], checked: true)
      render json: placement
    end
  end

  def check
    placement = Placement.find(params[:id])
    if params[:checked] === true
      placement.update(checked: true)
      render json: placement
    else
      render json: {errors: "Something went wrong!"}
    end
  end


end
