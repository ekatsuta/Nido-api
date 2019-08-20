class CasesController < ApplicationController
  def index
    cases = Case.all
    render json: cases
  end

  def create
    case_inst = Case.create(user_id: params[:user_id], num_members: params[:case][:num_members], guest_type: params[:case][:guest_type],household_preference: params[:case][:household_preference], special_notes: params[:case][:special_notes],image_url: params[:case][:image_url])

    Language.createLinks(params[:case][:languages], case_inst.id)

    render json: case_inst

  end

  def update
    case_inst = Case.find(params[:id])
    case_inst.update(user_id: params[:caseObj][:user_id], num_members: params[:caseObj][:num_members], guest_type: params[:caseObj][:guest_type],household_preference: params[:caseObj][:household_preference], special_notes: params[:caseObj][:special_notes],image_url: params[:caseObj][:image_url])

    render json: case_inst
  end

  def destroy
    case_inst = Case.find(params[:id])
    case_inst.destroy

    render json: {message: "successfully deleted"}
  end



end
