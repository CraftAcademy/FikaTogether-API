class Api::FikasController < ApplicationController
  before_action :authenticate_admin!, only: :create

  def index
    fikas = Fika.all
    if fikas.any?
      render json: fikas, each_serializer: Fikas::IndexSerializer
    else
      render json: { message: 'There are no fikas in the database' }, status: 404
    end
  end

  def create
    begin
      fikas = Fika.participants_uniq_matcher
      fikas.each do |fikas_participants|
        similarity = SimilarityService.cosine_similarity(fikas_participants)
        Fika.create(start_date: Time.now,
                    end_date: Time.now + 30.minutes,
                    participants: fikas_participants,
                    similarity: similarity)
      end
  
      if fikas.any?
        render json: { message: 'Fikas successfully created' }, status: 201
      else
        render_error_messages('There are no participants in the database', 404)
      end
      
    rescue => error
      render_error_messages(error, 400)
    end
  end

  private

  def render_error_messages(error_message, status_code)
    render json: { message: error_message }, status: status_code
  end
end
