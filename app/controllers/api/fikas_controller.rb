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
    arr_sorted = Fika.participants_uniq_matcher
    arr_sorted.each do |fika|
      similartiy_module = SimilarityService.cosine_similarity(fika)
      similarity = Fika.cosine_similarity_model(fika)
      Fika.create(start_date: Time.now, end_date: Time.now + 30.minutes, participants: fika,
                  similarity: similarity)
    end

    if arr_sorted.any?
      render json: { message: 'Fikas successfully created' }, status: 201
    else
      render json: { message: 'There are no participants in the database' }, status: 404
    end
  end
end
