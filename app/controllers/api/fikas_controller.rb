class Api::FikasController < ApplicationController
  def index
    fikas = Fika.all
    render json: fikas, each_serializer: Fikas::IndexSerializer
  end
end
