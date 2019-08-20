class AuthController < ApplicationController
  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      render json: user
    else
      render json: {errors: "Wrong username or password"}
    end
  end
end
