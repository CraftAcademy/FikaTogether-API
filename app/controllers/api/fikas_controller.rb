class Api::FikasController < ApplicationController
  def index
    fikas = Fika.all
    if fikas.any?
      render json: fikas, each_serializer: Fikas::IndexSerializer
    else
      render json: { message: 'There are no fikas in the database' }, status: 404
    end
  end

  def create
    participants = Participant.all
    arr = participants.to_a.permutation(2).to_a
    
    
    
    arr.each do |pair|
      
      binding.pry
      
      # arr.sort
    end
  end
end
