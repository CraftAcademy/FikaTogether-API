class Api::FikasController < ApplicationController
  before_action :authenticate_admin!, only: :create

  def index
    fikas = Fika.order(:similarity)
    if fikas.any?
      render json: fikas, each_serializer: Fikas::IndexSerializer
    else
      render json: { message: 'There are no fikas in the database' }, status: 404
    end
  end

  def create    
    fika_pairs = Fika.participants_uniq_matcher
    # assign dates to each pair
    fikas_with_dates = ScheduleService.match(fika_pairs, params[:fika][:date], params[:fika][:time_slots])
    binding.pry
    fika_pairs.each do |pair|
      similarity = SimilarityService.cosine_similarity(pair)
      Fika.create(start_date: Time.now,
                  end_date: Time.now + 30.minutes,
                  participants: pair,
                  similarity: similarity)
    end

    if Fika.any?
      render json: { message: 'Fikas successfully created' }, status: 201
    else
      render_error_messages('There are no participants in the database', 404)
    end
  rescue StandardError => e
    render_error_messages(e, 400)
  end

  private

  def render_error_messages(error_message, status_code)
    render json: { message: error_message }, status: status_code
  end
end
