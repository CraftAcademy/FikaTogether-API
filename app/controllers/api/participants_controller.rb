class Api::ParticipantsController < ApplicationController
  before_action :authenticate_admin!, only: :create

  def create
    participant = Participant.new(participant_params)
    participant.department = Department.find_by(name: params[:participant][:department])
    participant.save

    if participant.persisted?
      render json: { message: 'You successfully added participant to the department.' }, status: 201
    else
      render json: { errors: participant.errors.full_messages.to_sentences }, status: 422
    end
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email, :management, :start_date, :seniority)
  end
end
