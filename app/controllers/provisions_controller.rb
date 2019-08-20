class ProvisionsController < ApplicationController
  def index
    provisions = Provision.all
    render json: provisions
  end
end
