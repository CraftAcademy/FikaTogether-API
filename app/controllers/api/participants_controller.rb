class Api::ParticipantsController < ApplicationController
  before_action :authenticate_admin!, only: [:create, :destroy]

  def create
    params_avatar = params[:participant][:avatar]
    
    participant = Participant.new(participant_params)
    participant.department = Department.find_by(name: params[:participant][:department])
    participant.save

    if participant.persisted? && params_avatar.present?
      DecodeService.attach_image(params_avatar, participant.avatar)
    end

    if participant.persisted?
      render json: { message: 'You successfully added participant to the department.' }, status: 201
    else
      render json: { errors: 'Sorry that department does not exist.' }, status: 422
    end
  end

  def destroy
    participant = Participant.find( params[:id] )
    participant.destroy
    render json: { message: 'You successfully deleted the participant from the department.' }, status: 202
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email, :management, :start_date, :seniority)
  end
end
