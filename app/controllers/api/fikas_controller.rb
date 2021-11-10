class Api::FikasController < ApplicationController
  before_action :authenticate_admin!

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
    arr_sorted = []
    arr.each do |pair|
      arr_sorted.push(pair.sort_by(&:id))
    end
    arr_sorted.uniq!

    arr_sorted.each do |fika|
      Fika.create(start_date: Time.now, end_date: Time.now + 30.minutes, participants: fika)
    end
    # binding.pry
    render json: {message: 'Fikas successfully created!!!'}, status: 201
  end
end
