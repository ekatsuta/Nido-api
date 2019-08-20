class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(
      username: params[:username],
      password: params[:password],
      email: params[:email],
      user_type: params[:userType])

    if user.save
      render json: user
    else
      render json: {errors: user.errors.full_messages}
    end
  end

  def update

    user = User.find(params[:id])
    if request.headers['Update-Type'] === 'initial'
      user.update(name: params[:name], description: params[:description], profile_image: params[:profile_image])
    elsif request.headers['Update-Type'] === 'edit'
      user.update(name: params[:name], username: params[:username], description: params[:description], profile_image: params[:profile_image])
      
    end

    render json: user
  end

  def loadListingsandCases
    listings = Listing.all
    cases = Case.all

    render json: {listings: listings, cases: cases}
  end

end
