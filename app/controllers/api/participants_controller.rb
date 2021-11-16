class Api::ParticipantsController < ApplicationController
  
  def create
    binding.pry
    @participant = Participant.new(participant_params)
    @participant.department = Department.find_by(name: @participant.department)
    @participant.save

    render json: {message: 'You successfully added participant to the department.'}, status: 201
  end

  private

  def participant_params
    params.require(:participant).permit(:name, :email, :department, :management, :start_date, :seniority)
  end
end
