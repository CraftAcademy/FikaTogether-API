class Api::FikasController < ApplicationController
  def index
    fikas = Fika.all
    render json: { fikas: fikas}
  end
end
