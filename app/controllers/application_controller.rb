class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

  private 

  def record_not_found_error
    render json: { error: 'Your request can not be processed at this time' }, status: 422
  end
end
